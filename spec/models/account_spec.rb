require 'rails_helper'

RSpec.describe Account, type: :model do
  it {should have_many(:transactions)}
  it {should have_many(:payment_means)}
  it {should have_many(:recurring_transactions)}

  it {should belong_to(:user)}

  it {should validate_presence_of(:user)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:currency)}
  it {should validate_length_of(:currency).is_equal_to(3)}


  it 'save currency as uppercase' do
    account = create(:account, currency: 'usd')
    expect(account.currency).to eq('USD')
  end
end
