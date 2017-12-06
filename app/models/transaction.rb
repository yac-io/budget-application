class Transaction < ApplicationRecord
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


  before_save :currency_as_uppercase


  private
  def currency_as_uppercase
    self.currency = currency.upcase
    self.settlement_currency = settlement_currency.upcase unless settlement_currency.nil?
  end

end
