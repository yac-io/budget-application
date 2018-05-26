class Account < ApplicationRecord
  has_many :transactions, -> {order('date desc, id asc')}
  has_many :payment_means
  has_many :recurring_transactions
  has_many :investments, -> {order('date desc, id asc')}
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :currency
  validates_presence_of :user
  validates_presence_of :account_type
  validates_inclusion_of :account_type, in: %w[cash investment]

  validates_length_of :currency, is: 3

  before_save :currency_to_uppercase

  def investment?
    account_type == 'investment'
  end

  def cash?
    account_type == 'cash'
  end

  def current_value
    transactions.where('date <= ?', Time.zone.now).sum(:settlement_amount)
  end

  def this_month_value
    transactions.where('date >= ? and date <= ?', Time.zone.now.at_beginning_of_month, Time.zone.now).sum(:settlement_amount)
  end

  def current_month_transactions
    transactions.where('date >= ? and date <= ?', Time.zone.now.at_beginning_of_month, Time.zone.now.at_end_of_month)
  end

  def months_with_transactions
    transactions.group_by {|t| t.date.at_beginning_of_month}
  end

  def total_transactions_per_month
    transactions
        .unscope(:order)
        .where('date <= ?', Time.zone.now.at_end_of_month)
        .group("DATE_TRUNC('month', date)")
        .order("DATE_TRUNC('month', date)")
        .sum('settlement_amount')
  end

  def end_of_months_total
    eom = total_transactions_per_month
    month = eom.keys
    values = eom.values
    sum = 0
    month.zip(values.map {|x| sum += x})
  end

  private

  def currency_to_uppercase
    self.currency = currency.upcase
  end
end
