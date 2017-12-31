require 'rails_helper'

RSpec.describe RecurringTransaction, type: :model do
  it {should belong_to(:account)}
  it {should belong_to(:payment_mean)}
  it {should belong_to(:category)}
  it {should belong_to(:user)}

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:account)}
  it {should validate_presence_of(:payment_mean)}
  it {should validate_presence_of(:recurring_rule)}
  it {should validate_presence_of(:settlement_currency)}
  it {should validate_presence_of(:settlement_amount)}
  it {should validate_presence_of(:user)}


  it 'save settlement currency as uppercase' do
    transaction = create(:recurring_transaction, settlement_currency: 'usd')
    expect(transaction.settlement_currency).to eq('USD')
  end

end
