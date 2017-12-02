require 'rails_helper'

RSpec.describe "payment_means/new", type: :view do
  before(:each) do
    assign(:payment_mean, PaymentMean.new(
      :name => "MyString",
      :currency => "MyString",
      :account => nil
    ))
  end

  it "renders new payment_mean form" do
    render

    assert_select "form[action=?][method=?]", payment_means_path, "post" do

      assert_select "input[name=?]", "payment_mean[name]"

      assert_select "input[name=?]", "payment_mean[currency]"

      assert_select "input[name=?]", "payment_mean[account_id]"
    end
  end
end
