require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it {should belong_to(:account)}
  it {should belong_to(:payment_mean)}
  it {should belong_to(:category)}
  it {should belong_to(:user)}

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:account)}
  it {should validate_presence_of(:payment_mean)}
  it {should validate_presence_of(:date)}
  it {should validate_presence_of(:currency)}
  it {should validate_presence_of(:amount)}
  it {should validate_presence_of(:user)}

  it 'save currency as uppercase' do
    transaction = create(:transaction, currency: 'usd')
    expect(transaction.currency).to eq('USD')
  end

  it 'save settlement currency as uppercase' do
    transaction = create(:transaction, settlement_currency: 'usd')
    expect(transaction.settlement_currency).to eq('USD')
  end

  it 'set the type to income when settlement amount is > 0' do
    transaction = create(:transaction, settlement_amount: '10')
    expect(transaction.income?).to be(true)
    expect(transaction.expense?).to be(false)
  end


  it 'set the type to income when settlement amount is 0' do
    transaction = create(:transaction, settlement_amount: '0')
    expect(transaction.income?).to be(true)
    expect(transaction.expense?).to be(false)
  end


  it 'set the type to expense when settlement amount is >= 0' do
    transaction = create(:transaction, settlement_amount: '-10')
    expect(transaction.income?).to be(false)
    expect(transaction.expense?).to be(true)
  end


end
