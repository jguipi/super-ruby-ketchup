require 'rails_helper'

RSpec.describe "Locals", type: :request do
  describe "GET /locals" do
    it "works! (now write some real specs)" do
      get locals_path
      expect(response).to have_http_status(200)
    end
  end
end
