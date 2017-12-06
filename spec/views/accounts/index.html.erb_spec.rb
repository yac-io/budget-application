require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
        create(:account, name: 'Name', currency: 'usd'),
        create(:account, name: 'Name', currency: 'usd')
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "USD".to_s, :count => 2
  end
end
