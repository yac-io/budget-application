require 'rails_helper'

RSpec.describe 'transactions/edit', type: :view do
  before(:each) do
    allow(view).to receive(:current_user).and_return(create(:user))
    @transaction = assign(:transaction, create(:transaction))
  end

  it 'renders the edit transaction form' do
    render

    assert_select 'form[action=?][method=?]', account_transaction_path(@transaction.account, @transaction), 'post' do

      assert_select 'select[name=?]', 'transaction[payment_mean_id]'

      assert_select 'select[name=?]', 'transaction[category_id]'

      assert_select 'input[name=?]', 'transaction[currency]'

      assert_select 'input[name=?]', 'transaction[name]'

      assert_select 'input[name=?]', 'transaction[amount]'

      assert_select 'input[name=?]', 'transaction[settlement_currency]'

      assert_select 'input[name=?]', 'transaction[settlement_amount]'
    end
  end
end
