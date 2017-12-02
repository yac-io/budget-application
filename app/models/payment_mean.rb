class PaymentMean < ApplicationRecord
  belongs_to :account

  validates_presence_of :name
  validates_presence_of :currency
  validates_length_of :currency, is: 3
  validates_presence_of :account

  before_save :currency_to_uppercase

  private
  def currency_to_uppercase
    self.currency = currency.upcase
  end
end
