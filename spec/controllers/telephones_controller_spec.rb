require 'rails_helper'

RSpec.describe EmployesController, type: :controller do
  describe "GET Index" do
    it "gets the index view" do
      get "index"
      expect(response.status).to be 200
    end

    it "gets the correct index view template" do
      subject {get :index}
      get "index"
      expect(subject).to render_template("employes/index")
    end
  end
end
