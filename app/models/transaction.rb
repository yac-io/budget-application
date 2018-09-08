class Transaction < ApplicationRecord
  enum transaction_type: {income: 0, expense: 1}

  scope :expenses, lambda {|account_id|
    where('account_id = ? and transaction_type = ?', account_id, Transaction.transaction_types[:expense])
  }

  scope :incomes, lambda {|account_id|
    where('account_id = ? and transaction_type = ?', account_id, Transaction.transaction_types[:income])
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
