require 'rails_helper'

RSpec.describe OrganismesController, type: :controller do
  let(:valid_attributes) {
    { "name" => "OrganismeNom", "mail" => "mail@gmail.com", "fax" => "450-450-4545", "telephone" => "450-444-4444", "adresse" => "uneAdresse" }
  }

  let(:invalid_attributes) {
    { "name" => "", "mail" => "", "fax" => "450-450-4504", "telephone" => "450-444-4444", "adresse" => "uneAdresse" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrganismesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET Index" do
    it "gets the index view" do
      get "index"
      expect(response.status).to be 200
    end

    it "gets the correct index view template" do
      get "index"
      expect(response).to render_template("organismes/index")
    end
  end

  describe "GET #show" do
    it "assigns the requested organisme as @organisme" do
      organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
      get :show, params: {id: organisme.to_param}, session: valid_session
      expect(assigns(:organisme)).to eq(organisme)
    end
  end

  describe "GET #new" do
    it "assigns a new organisme as @organisme" do
      get :new, params: {}, session: valid_session
      expect(assigns(:organisme)).to be_a_new(Organisme)
      organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
      expect(organisme.name).to respond_to
      expect(organisme.id).to respond_to
    end
  end

  describe "GET #edit" do
    it "assigns the requested organisme as @organisme" do
      organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
      expect(organisme.name).to respond_to
      expect(organisme.id).to respond_to
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Organisme" do
        expect {
          post :create, params: {organisme: valid_attributes}, session: valid_session
        }.to change(Organisme, :count).by(1)
      end

      it "assigns a newly created organisme as @organisme" do
        post :create, params: {organisme: valid_attributes}, session: valid_session
        expect(assigns(:organisme)).to be_a(Organisme)
        expect(assigns(:organisme)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved organisme as @organisme" do
        post :create, params: {organisme: invalid_attributes}, session: valid_session
        expect(assigns(:organisme)).to be_a_new(Organisme)
      end

      it "re-renders the 'new' template" do
        post :create, params: {organisme: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { "name" => "OrganismeNom updater", "mail" => "mail@gmail.com", "fax" => "450-450-4545", "telephone" => "450-444-4444", "adresse" => "uneAdresse" }
      }

      it "updates the requested organisme" do
        organisme = Organisme.create! valid_attributes
        put :update, params: {id: organisme.to_param, organisme: new_attributes}, session: valid_session
        organisme.reload
      end

      it "assigns the requested organisme as @organisme" do
        organisme = Organisme.create! valid_attributes
        put :update, params: {id: organisme.to_param, organisme: valid_attributes}, session: valid_session
        expect(assigns(:organisme)).to eq(organisme)
      end

      it "redirects to the organisme" do
        organisme = Organisme.create! valid_attributes
        put :update, params: {id: organisme.to_param, organisme: valid_attributes}, session: valid_session
        expect(response).to redirect_to(organisme)
      end
    end

    context "with invalid params" do
      it "assigns the organisme as @organisme" do
        organisme = Organisme.create! valid_attributes
        put :update, params: {id: organisme.to_param, organisme: invalid_attributes}, session: valid_session
        expect(assigns(:organisme)).to eq(organisme)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested organisme" do
      organisme = Organisme.create! valid_attributes
      expect {
        delete :destroy, params: {id: organisme.to_param}, session: valid_session
      }.to change(Organisme, :count).by(-1)
    end
  end
end
