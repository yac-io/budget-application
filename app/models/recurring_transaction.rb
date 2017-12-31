class RecurringTransaction < ApplicationRecord
  belongs_to :account
  belongs_to :payment_mean
  belongs_to :category, optional: true
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :account
  validates_presence_of :payment_mean
  validates_presence_of :settlement_currency
  validates_presence_of :settlement_amount
  validates_presence_of :recurring_rule
  validates_presence_of :name

  before_save :currency_as_uppercase

  private

  def currency_as_uppercase
    self.settlement_currency = settlement_currency.upcase unless settlement_currency.nil?
  end
end
