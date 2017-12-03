class Account < ApplicationRecord
  has_many :transactions
  has_many :payment_means


  validates_presence_of :name
  validates_presence_of :currency

  validates_length_of :currency, is: 3

  before_save :currency_to_uppercase

  private
  def currency_to_uppercase
    self.currency = currency.upcase
  end


end
