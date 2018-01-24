require 'rails_helper'

RSpec.describe 'investments/show', type: :view do
  before(:each) do
    @investment = assign(:investment, create(:investment,
                                             name: 'Name',
                                             isin: 'Isin',
                                             quantity: 2,
                                             settlement_amount: '9.99',
                                             settlement_currency: 'USD',
                                             account: create(:account, name: 'account name'),
                                             ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Isin/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/USD/)
    expect(rendered).to match(//)
  end
end
