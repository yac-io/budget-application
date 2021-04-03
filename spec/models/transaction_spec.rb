require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it {is_expected.to belong_to(:account)}
  it {is_expected.to belong_to(:payment_mean)}
  it {is_expected.to belong_to(:category)}
  it {is_expected.to belong_to(:user).optional}

  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:account)}
  it {is_expected.to validate_presence_of(:payment_mean)}
  it {is_expected.to validate_presence_of(:date)}
  it {is_expected.to validate_presence_of(:currency)}
  it {is_expected.to validate_presence_of(:amount)}
  it {is_expected.to validate_presence_of(:user)}

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
