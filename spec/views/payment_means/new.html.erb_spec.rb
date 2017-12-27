require 'rails_helper'

RSpec.describe 'payment_means/new', type: :view do
  before(:each) do
    allow(view).to receive(:current_user).and_return(create(:user))
    assign(:payment_mean, PaymentMean.new(
      :name => 'MyString',
      :currency => 'MyString',
      :account => nil
    ))
  end

  it 'renders new payment_mean form' do
    render

    assert_select 'form[action=?][method=?]', payment_means_path, 'post' do

      assert_select 'input[name=?]', 'payment_mean[name]'

      assert_select 'input[name=?]', 'payment_mean[currency]'

      assert_select 'select[name=?]', 'payment_mean[account_id]'
    end
  end
end
