require 'rails_helper'

RSpec.describe 'recurring_transactions/new', type: :view do
  before(:each) do
    allow(view).to receive(:current_user).and_return(create(:user))
    @account = create(:account)
    @recurring_transaction = assign(:recurring_transaction, create(:recurring_transaction, account: @account))
  end

  it 'renders new recurring_transaction form' do
    render

    assert_select 'form[action=?][method=?]', account_recurring_transaction_path(@recurring_transaction.account, @recurring_transaction), 'post' do

      assert_select 'select[name=?]', 'recurring_transaction[recurring_rule]'

      assert_select 'select[name=?]', 'recurring_transaction[payment_mean_id]'

      assert_select 'select[name=?]', 'recurring_transaction[category_id]'

      assert_select 'input[name=?]', 'recurring_transaction[name]'

      assert_select 'input[name=?]', 'recurring_transaction[settlement_currency]'

      assert_select 'input[name=?]', 'recurring_transaction[settlement_amount]'

    end
  end
end
