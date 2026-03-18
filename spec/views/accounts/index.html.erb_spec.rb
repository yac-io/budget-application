require 'rails_helper'

RSpec.describe 'accounts/index', type: :view do
  before(:each) do
    assign(:accounts, [
        create(:account, name: 'Name', currency: 'usd'),
        create(:account, name: 'Name', currency: 'usd')
    ])

    # Chart data is rendered with Groupdate + Chartkick; we don't need to
    # exercise that here, so stub it to avoid external gem coupling.
    allow(Transaction).to receive_message_chain(:where, :group_by_month, :sum).and_return({})
  end

  it 'renders a list of accounts' do
    render
    assert_select '.card>.card-body>h4', text: 'Name 0.00 USD', count: 2
  end
end
