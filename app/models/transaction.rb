class Transaction < ApplicationRecord
  enum transaction_type: {income: 0, expense: 1}

  scope :by_month_by_type, lambda {|account_id|
    where('account_id = ?', account_id)
        .group('extract(year from date)')
        .group('extract(month from date)')
        .group('transaction_type')
        .order('extract(year from date) asc, extract(month from date) asc')
        .sum('settlement_amount')
  }

  scope :expense_by_month_by_category, lambda {|account_id|
    joins(:category)
        .where('account_id = ? and transaction_type = ?', account_id, Transaction.transaction_types[:expense])
        .group('extract(year from date)')
        .group('extract(month from date)')
        .group('categories.name')
        .order('extract(year from date) asc, extract(month from date) asc, categories.name')
        .sum('settlement_amount')
  }

  belongs_to :account
  belongs_to :payment_mean
  belongs_to :user
  belongs_to :category, optional: true

  validates_presence_of :account
  validates_presence_of :payment_mean
  validates_presence_of :name
  validates_presence_of :currency
  validates_presence_of :amount
  validates_presence_of :date
  validates_presence_of :user

  before_save :currency_as_uppercase, :set_type


  private

  def currency_as_uppercase
    self.currency = currency.upcase
    self.settlement_currency = settlement_currency.upcase unless settlement_currency.nil?
  end

  def set_type
    if self.settlement_amount >= 0
      self.transaction_type = Transaction.transaction_types[:income]
    else
      self.transaction_type = Transaction.transaction_types[:expense]
    end
  end
end
