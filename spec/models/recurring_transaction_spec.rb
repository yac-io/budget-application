require 'rails_helper'

RSpec.describe RecurringTransaction, type: :model do
  it {is_expected.to belong_to(:account)}
  it {is_expected.to belong_to(:payment_mean)}
  it {is_expected.to belong_to(:category).optional}
  it {is_expected.to belong_to(:user)}

  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:account)}
  it {is_expected.to validate_presence_of(:payment_mean)}
  it {is_expected.to validate_presence_of(:recurring_rule)}
  it {is_expected.to validate_presence_of(:settlement_currency)}
  it {is_expected.to validate_presence_of(:settlement_amount)}
  it {is_expected.to validate_presence_of(:user)}


  it 'save settlement currency as uppercase' do
    transaction = create(:recurring_transaction, settlement_currency: 'usd')
    expect(transaction.settlement_currency).to eq('USD')
  end

end
