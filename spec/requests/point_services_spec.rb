require 'rails_helper'

RSpec.describe "PointServices", type: :request do
  describe "GET /point_services" do
    it "works! (now write some real specs)" do
      get point_services_path
      expect(response).to have_http_status(200)
    end
  end
end
