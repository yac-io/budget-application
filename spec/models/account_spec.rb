require 'rails_helper'

RSpec.describe Account, type: :model do
  it {should have_many(:transactions)}
  it {should have_many(:payment_means)}
  it {should have_many(:recurring_transactions)}
  it {should have_many(:investments)}

  it {should belong_to(:user)}

  it {should validate_presence_of(:user)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:currency)}
  it {should validate_length_of(:currency).is_equal_to(3)}
  it {should validate_presence_of(:account_type)}
  it {should validate_inclusion_of(:account_type).in_array(%w[cash investment])}

  it 'save currency as uppercase' do
    account = create(:account, currency: 'usd')
    expect(account.currency).to eq('USD')
  end


  it 'evaluates investment? to true if account_type is investment' do
    account = create(:account, account_type: 'investment')
    expect(account.investment?).to be(true)
    expect(account.cash?).to be(false)

  end

  it 'evaluates cash? to true if account_type is cash' do
    account = create(:account, account_type: 'cash')
    expect(account.cash?).to be(true)
    expect(account.investment?).to be(false)
  end


end
