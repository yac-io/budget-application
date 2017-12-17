require 'rails_helper'

RSpec.describe 'transactions/new', type: :view do
  before(:each) do
    view.stub(:current_user) {User.new}
    assign(:transaction, Transaction.new(
      :account => nil,
      :payment_mean => nil,
      :category => nil,
      :currency => 'MyString',
      :name => 'MyString',
      :amount => '9.99',
      :settlement_currency => 'MyString',
      :settlement_amount => ''
    ))
  end

  it 'renders new transaction form' do
    render

    assert_select 'form[action=?][method=?]', transactions_path, 'post' do

      assert_select 'select[name=?]', 'transaction[account_id]'

      assert_select 'select[name=?]', 'transaction[payment_mean_id]'

      assert_select 'input[name=?]', 'transaction[category_id]'

      assert_select 'input[name=?]', 'transaction[currency]'

      assert_select 'input[name=?]', 'transaction[name]'

      assert_select 'input[name=?]', 'transaction[amount]'

      assert_select 'input[name=?]', 'transaction[settlement_currency]'

      assert_select 'input[name=?]', 'transaction[settlement_amount]'
    end
  end
end
