require 'rails_helper'

RSpec.describe Account, type: :model do
  it {is_expected.to have_many(:transactions)}
  it {is_expected.to have_many(:payment_means)}
  it {is_expected.to have_many(:recurring_transactions)}
  it {is_expected.to have_many(:investments)}

  it {is_expected.to belong_to(:user)}

  it {is_expected.to validate_presence_of(:user)}
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:currency)}
  it {is_expected.to validate_length_of(:currency).is_equal_to(3)}
  it {is_expected.to validate_presence_of(:account_type)}
  it {is_expected.to validate_inclusion_of(:account_type).in_array(%w[cash investment])}

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
