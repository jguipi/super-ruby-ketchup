require "rails_helper"

RSpec.describe DepartementsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/departements").to route_to("departements#index")
    end

    it "routes to #new" do
      expect(:get => "/departements/new").to route_to("departements#new")
    end

    it "routes to #show" do
      expect(:get => "/departements/1").to route_to("departements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/departements/1/edit").to route_to("departements#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/departements").to route_to("departements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/departements/1").to route_to("departements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/departements/1").to route_to("departements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/departements/1").to route_to("departements#destroy", :id => "1")
    end

  end
end
