require 'rails_helper'

RSpec.describe Investment, type: :model do
  it {should belong_to(:user)}
  it {should belong_to(:account)}
  it {should validate_presence_of(:user)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:isin)}
  it {should validate_presence_of(:date)}
  it {should validate_presence_of(:settlement_currency)}
  it {should validate_presence_of(:settlement_amount)}
  it {should validate_presence_of(:quantity)}

  it {should validate_length_of(:settlement_currency).is_equal_to(3)}

  it 'save settlement currency as uppercase' do
    investment = create(:investment, settlement_currency: 'usd')
    expect(investment.settlement_currency).to eq('USD')
  end

  it 'save isin as uppercase' do
    investment = create(:investment, isin: 'fr124')
    expect(investment.isin).to eq('FR124')
  end
end
