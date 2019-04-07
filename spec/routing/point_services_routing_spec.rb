require "rails_helper"

RSpec.describe PointServicesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/point_services").to route_to("point_services#index")
    end

    it "routes to #new" do
      expect(:get => "/point_services/new").to route_to("point_services#new")
    end

    it "routes to #show" do
      expect(:get => "/point_services/1").to route_to("point_services#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/point_services/1/edit").to route_to("point_services#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/point_services").to route_to("point_services#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/point_services/1").to route_to("point_services#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/point_services/1").to route_to("point_services#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/point_services/1").to route_to("point_services#destroy", :id => "1")
    end

  end
end
