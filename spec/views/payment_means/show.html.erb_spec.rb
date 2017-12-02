require 'rails_helper'

RSpec.describe 'payment_means/show', type: :view do
  before(:each) do
    account = create(:account, name: 'account name')
    @payment_mean = assign(:payment_mean, PaymentMean.create!(
        :name => 'Name',
        :currency => 'USD',
        :account => account
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/USD/)
    expect(rendered).to match(/account name/)
  end
end
