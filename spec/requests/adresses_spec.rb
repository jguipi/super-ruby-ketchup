require 'rails_helper'

RSpec.describe "Adresses", type: :request do
  describe "GET /adresses" do
    it "works! (now write some real specs)" do
      get adresses_path
      expect(response).to have_http_status(200)
    end
  end
end
