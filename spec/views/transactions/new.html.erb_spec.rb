require 'rails_helper'

RSpec.describe 'transactions/new', type: :view do
  before(:each) do
    allow(view).to receive(:current_user).and_return(create(:user))
    @account = create(:account)
    assign(:transaction, Transaction.new(
                           account: @account,
                           payment_mean: nil,
                           category: nil,
                           currency: 'MyString',
                           name: 'MyString',
                           amount: '9.99',
                           settlement_currency: 'MyString',
                           settlement_amount: ''
    ))
  end

  it 'renders new transaction form' do
    render

    assert_select 'form[action=?][method=?]', account_transactions_path(@account), 'post' do
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
