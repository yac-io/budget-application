require 'rails_helper'

RSpec.describe PaymentMean, type: :model do
  it {is_expected.to have_many(:transactions)}

  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:currency)}
  it {is_expected.to validate_presence_of(:account)}
  it {is_expected.to validate_presence_of(:user)}
  it {is_expected.to validate_length_of(:currency).is_equal_to(3)}
  it {is_expected.to belong_to :account}
  it {is_expected.to belong_to :user}


  it 'save currency as uppercase' do
    payment_mean = create(:payment_mean, currency: 'usd')
    expect(payment_mean.currency).to eq('USD')
  end
end
