require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it {should belong_to(:account)}
  it {should belong_to(:payment_mean)}
  it {should belong_to(:category)}

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:account)}
  it {should validate_presence_of(:payment_mean)}
  it {should validate_presence_of(:date)}
  it {should validate_presence_of(:currency)}
  it {should validate_presence_of(:amount)}

  it 'save currency as uppercase' do
    transaction = create(:transaction, currency: 'usd')
    expect(transaction.currency).to eq('USD')
  end

  it 'save settlement currency as uppercase' do
    transaction = create(:transaction, settlement_currency: 'usd')
    expect(transaction.settlement_currency).to eq('USD')
  end

end
