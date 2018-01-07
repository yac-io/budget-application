class Account < ApplicationRecord
  has_many :transactions, -> {order('date desc, id asc')}
  has_many :payment_means
  has_many :recurring_transactions
  belongs_to :user


  validates_presence_of :name
  validates_presence_of :currency
  validates_presence_of :user

  validates_length_of :currency, is: 3

  before_save :currency_to_uppercase


  def current_value
    transactions.where('date <= ?', Time.zone.now).sum(:settlement_amount)
  end

  def this_month_value
    transactions.where('date >= ? and date <= ?', Time.zone.now.at_beginning_of_month, Time.zone.now).sum(:settlement_amount)
  end

  def previous_month_value
    transactions.where('date >= ? and date <= ?', (Time.zone.now - 1.month).at_beginning_of_month, (Time.zone.now - 1.month)).sum(:settlement_amount)
  end

  def this_month_to_previous_month_ratio
    this_month_value/previous_month_value
  end

  private
  def currency_to_uppercase
    self.currency = currency.upcase
  end


end
