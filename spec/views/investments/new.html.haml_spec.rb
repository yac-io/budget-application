require 'rails_helper'

RSpec.describe 'investments/new', type: :view do
  before(:each) do
    allow(view).to receive(:current_user).and_return(create(:user))
    @account = create(:account)
    assign(:investment, Investment.new(
                          account: @account,
                          name: 'MyString',
                          isin: 'MyString',
                          quantity: 1,
                          settlement_amount: '9.99',
                          settlement_currency: 'USD'
    ))
  end

  it 'renders new investment form' do
    render

    assert_select 'form[action=?][method=?]', account_investments_path(@account), 'post' do
      assert_select 'input[name=?]', 'investment[name]'

      assert_select 'input[name=?]', 'investment[isin]'

      assert_select 'input[name=?]', 'investment[quantity]'

      assert_select 'input[name=?]', 'investment[settlement_amount]'

      assert_select 'input[name=?]', 'investment[settlement_currency]'
    end
  end
end
