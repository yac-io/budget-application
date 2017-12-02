require 'rails_helper'

RSpec.describe "PaymentMeans", type: :request do
  describe "GET /payment_means" do
    it "works! (now write some real specs)" do
      get payment_means_path
      expect(response).to have_http_status(200)
    end
  end
end
