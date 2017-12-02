require 'rails_helper'

RSpec.describe PaymentMean, type: :model do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:currency)}
  it {should validate_presence_of(:account)}
  it {should validate_length_of(:currency).is_equal_to(3)}
  it {should belong_to :account}


  it 'save currency as uppercase' do
    account = create(:account)
    payment_mean = PaymentMean.create! name: 'name', currency: 'usd', account: account
    expect(payment_mean.currency).to eq('USD')
  end
end
