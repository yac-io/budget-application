require 'rails_helper'

RSpec.describe 'recurring_transactions/index', type: :view do
  before(:each) do
    @account = assign(:account, create(:account))
    @payment_mean = create(:payment_mean)
    assign(:recurring_transactions, [
             create(:recurring_transaction,
                    recurring_rule: 'Recurring Rule',
                    account: @account,
                    payment_mean: @payment_mean,
                    category: nil,
                    name: 'Name',
                    settlement_currency: 'EUR',
                    settlement_amount: '9.99',
                    last_run_date: Date.today,
                    active: true),
             create(:recurring_transaction,
                    recurring_rule: 'Recurring Rule',
                    account: @account,
                    payment_mean: @payment_mean,
                    category: nil,
                    name: 'Name',
                    settlement_currency: 'EUR',
                    settlement_amount: '9.99',
                    last_run_date: Date.today,
                    active: true)
           ])
  end

  it 'renders a list of recurring_transactions' do
    render
    assert_select 'tr>td', :text => 'Recurring Rule'.to_s, :count => 2
    assert_select 'tr>td', :text => @account.name, :count => 2
    assert_select 'tr>td', :text => @payment_mean.name, :count => 2
    assert_select 'tr>td', :text => nil.to_s, :count => 2
    assert_select 'tr>td', :text => 'Name'.to_s, :count => 2
    assert_select 'tr>td', :text => '9.99 EUR'.to_s, :count => 2
    assert_select 'tr>td', :text => 'true', :count => 2
    assert_select 'tr>td', :text => Date.today.to_s, :count => 2
  end
end
