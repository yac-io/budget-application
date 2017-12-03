require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
        account: create(:account, name: 'account name'),
        payment_mean: create(:payment_mean, name: 'payment mean name'),
        category: create(:category, name: 'category name'),
        name: "Name",
        currency: "USD",
        amount: "9.99",
        settlement_currency: "EUR",
        settlement_amount: "132.43",
        date: Date.today
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/account name/)
    expect(rendered).to match(/payment mean name/)
    expect(rendered).to match(/category name/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99 USD/)
    expect(rendered).to match(/132.43 EUR/)
  end
end
