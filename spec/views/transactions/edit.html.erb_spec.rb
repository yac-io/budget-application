require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :account => create(:account),
      :payment_mean => create(:payment_mean),
      :category => nil,
      :currency => "USD",
      :name => "MyString",
      :amount => "9.99",
      :settlement_currency => "EUR",
      :settlement_amount => "12.33",
      :date => Date.today
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input[name=?]", "transaction[account_id]"

      assert_select "input[name=?]", "transaction[payment_mean_id]"

      assert_select "input[name=?]", "transaction[category_id]"

      assert_select "input[name=?]", "transaction[currency]"

      assert_select "input[name=?]", "transaction[name]"

      assert_select "input[name=?]", "transaction[amount]"

      assert_select "input[name=?]", "transaction[settlement_currency]"

      assert_select "input[name=?]", "transaction[settlement_amount]"
    end
  end
end
