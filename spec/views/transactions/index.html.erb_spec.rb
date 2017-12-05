require 'rails_helper'

RSpec.describe 'transactions/index', type: :view do
  before(:each) do
    account = create(:account, name: 'account name')
    payment_mean = create(:payment_mean, name: 'paymentmean name')
    category = create(:category, name: 'category name')
    assign(:transactions, [
        Transaction.create!(
            account: account,
            payment_mean: payment_mean,
            category: category,
            currency: 'EUR',
            amount: '9.99',
            name: 'Name',
            settlement_currency: 'USD',
            settlement_amount: '12.32',
            date: Date.today
        ),
        Transaction.create!(
            account: account,
            payment_mean: payment_mean,
            category: category,
            currency: 'eur',
            amount: '9.99',
            name: 'Name',
            settlement_currency: 'usd',
            settlement_amount: '12.32',
            date: Date.today
        )
    ])
  end

  it 'renders a list of transactions' do
    render
    assert_select 'tr>td', text: Date.today.to_s, count: 2
    assert_select 'tr>td', text: 'account name'.to_s, count: 2
    assert_select 'tr>td', text: 'paymentmean name'.to_s, count: 2
    assert_select 'tr>td', text: 'category name'.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: '9.99&nbsp;EUR'.to_s, count: 2
    assert_select 'tr>td', text: '12.32&nbsp;USD'.to_s, count: 2
  end
end
