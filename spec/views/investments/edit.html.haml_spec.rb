require 'rails_helper'

RSpec.describe 'investments/edit', type: :view do
  before(:each) do
    allow(view).to receive(:current_user).and_return(create(:user))
    @investment = assign(:investment, create(:investment))
  end

  it 'renders the edit investment form' do
    render

    assert_select 'form[action=?][method=?]', account_investment_path(@investment.account, @investment), 'post' do
      assert_select 'input[name=?]', 'investment[name]'

      assert_select 'input[name=?]', 'investment[isin]'

      assert_select 'input[name=?]', 'investment[quantity]'

      assert_select 'input[name=?]', 'investment[settlement_amount]'

      assert_select 'input[name=?]', 'investment[settlement_currency]'
    end
  end
end
