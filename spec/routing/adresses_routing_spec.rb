require "rails_helper"

RSpec.describe AdressesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/adresses").to route_to("adresses#index")
    end

    it "routes to #new" do
      expect(:get => "/adresses/new").to route_to("adresses#new")
    end

    it "routes to #show" do
      expect(:get => "/adresses/1").to route_to("adresses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/adresses/1/edit").to route_to("adresses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/adresses").to route_to("adresses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/adresses/1").to route_to("adresses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/adresses/1").to route_to("adresses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/adresses/1").to route_to("adresses#destroy", :id => "1")
    end

  end
end
