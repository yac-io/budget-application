require 'rails_helper'

RSpec.describe Account, type: :model do
  it {should have_many(:transactions)}
  it {should have_many(:payment_means)}

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:currency)}
  it {should validate_length_of(:currency).is_equal_to(3)}


  it 'save currency as uppercase' do
    account = Account.create! name: 'name', currency: 'usd'
    expect(account.currency).to eq('USD')
  end
end
