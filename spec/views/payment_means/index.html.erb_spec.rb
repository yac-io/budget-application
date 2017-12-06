require 'rails_helper'

RSpec.describe 'payment_means/index', type: :view do
  before(:each) do
    account = create(:account, name: 'account name')
    assign(:payment_means, [
        create(:payment_mean, name: 'Name', currency: 'USD', account: account),
        create(:payment_mean, name: 'Name', currency: 'USD', account: account)
    ])
  end

  it 'renders a list of payment_means' do
    render
    assert_select 'tr>td', :text => 'Name'.to_s, :count => 2
    assert_select 'tr>td', :text => 'USD'.to_s, :count => 2
    assert_select 'tr>td', :text => 'account name', :count => 2
  end
end
