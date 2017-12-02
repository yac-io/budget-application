require "rails_helper"

RSpec.describe PaymentMeansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/payment_means").to route_to("payment_means#index")
    end

    it "routes to #new" do
      expect(:get => "/payment_means/new").to route_to("payment_means#new")
    end

    it "routes to #show" do
      expect(:get => "/payment_means/1").to route_to("payment_means#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/payment_means/1/edit").to route_to("payment_means#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/payment_means").to route_to("payment_means#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/payment_means/1").to route_to("payment_means#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/payment_means/1").to route_to("payment_means#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/payment_means/1").to route_to("payment_means#destroy", :id => "1")
    end

  end
end
