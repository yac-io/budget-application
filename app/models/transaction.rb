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

  def self.total_by_month_by_transaction_type(account_id)
    by_month = {}
    months = []
    Transaction.by_month_by_type(account_id).each do |k, v|
      month = Date.new(k[0].to_i, k[1].to_i, 1)
      months << month

      by_month[month] = {expense: 0, income: 0} if by_month[month].nil?

      if k[2] == Transaction.transaction_types[:expense] || k[2] == 'expense'
        by_month[month][:expense] = v
      else
        by_month[month][:income] = v
      end
    end
    by_month
  end

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
