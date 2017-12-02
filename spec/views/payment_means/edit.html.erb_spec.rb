require 'rails_helper'

RSpec.describe "payment_means/edit", type: :view do
  before(:each) do
    @payment_mean = assign(:payment_mean, create(:payment_mean))
  end

  it "renders the edit payment_mean form" do
    render

    assert_select "form[action=?][method=?]", payment_mean_path(@payment_mean), "post" do

      assert_select "input[name=?]", "payment_mean[name]"

      assert_select "input[name=?]", "payment_mean[currency]"

      assert_select "input[name=?]", "payment_mean[account_id]"
    end
  end
end
