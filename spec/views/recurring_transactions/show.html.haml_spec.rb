require 'rails_helper'

RSpec.describe 'recurring_transactions/show', type: :view do
  before(:each) do
    @recurring_transaction = assign(:recurring_transaction, create(:recurring_transaction,
                                                                   recurring_rule: 'Recurring Rule',
                                                                   account: create(:account),
                                                                   payment_mean: create(:payment_mean),
                                                                   category: nil,
                                                                   name: 'Name',
                                                                   settlement_currency: 'EUR',
                                                                   settlement_amount: '9.99'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Recurring Rule/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/EUR/)
    expect(rendered).to match(/9.99/)
  end
end
