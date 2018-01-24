class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :account

  validates_presence_of :user
  validates_presence_of :name
  validates_presence_of :isin
  validates_presence_of :quantity
  validates_presence_of :date
  validates_presence_of :settlement_amount
  validates_presence_of :settlement_currency

  before_save :currency_as_uppercase, :isin_as_uppercase

  validates_length_of :settlement_currency, is: 3


  private

  def currency_as_uppercase
    self.settlement_currency = settlement_currency.upcase unless settlement_currency.nil?
  end
  def isin_as_uppercase
    self.isin = isin.upcase unless isin.nil?
  end
end
