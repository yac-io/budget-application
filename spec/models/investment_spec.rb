require 'rails_helper'

RSpec.describe Investment, type: :model do
  it {is_expected.to belong_to(:user)}
  it {is_expected.to belong_to(:account)}
  it {is_expected.to validate_presence_of(:user)}
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:isin)}
  it {is_expected.to validate_presence_of(:date)}
  it {is_expected.to validate_presence_of(:settlement_currency)}
  it {is_expected.to validate_presence_of(:settlement_amount)}
  it {is_expected.to validate_presence_of(:quantity)}

  it {is_expected.to validate_length_of(:settlement_currency).is_equal_to(3)}

  it 'save settlement currency as uppercase' do
    investment = create(:investment, settlement_currency: 'usd')
    expect(investment.settlement_currency).to eq('USD')
  end

  it 'save isin as uppercase' do
    investment = create(:investment, isin: 'fr124')
    expect(investment.isin).to eq('FR124')
  end
end
