require 'rails_helper'

RSpec.describe PaymentMean, type: :model do
  it {should have_many(:transactions)}

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:currency)}
  it {should validate_presence_of(:account)}
  it {should validate_presence_of(:user)}
  it {should validate_length_of(:currency).is_equal_to(3)}
  it {should belong_to :account}
  it {should belong_to :user}


  it 'save currency as uppercase' do
    payment_mean = create(:payment_mean, currency: 'usd')
    expect(payment_mean.currency).to eq('USD')
  end
end
