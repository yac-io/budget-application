require 'rails_helper'

RSpec.describe 'accounts/index', type: :view do
  before(:each) do
    assign(:accounts, [
        create(:account, name: 'Name', currency: 'usd'),
        create(:account, name: 'Name', currency: 'usd')
    ])
  end

  it 'renders a list of accounts' do
    render
    assert_select '.mdl-card>.mdl-card__title>h4', text: 'Name'.to_s+"\n\n0.00 USD".to_s, count: 2
  end
end
