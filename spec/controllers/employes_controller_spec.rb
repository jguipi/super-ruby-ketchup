require 'rails_helper'

RSpec.describe EmployesController, type: :controller do

  let(:valid_attributes) {
    { "nom" => "elnom", "prenom" => "elprenom", "courriel" => "test@test.com", "organisme_id" => 1 }
  }

  let(:invalid_attributes) {
    { "prenom" => "elprenom", "organisme_id" => 1 }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmployesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

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

  describe "GET #show" do
    it "assigns the requested employe as @employe" do
      organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
      employe = Employe.create! valid_attributes
      get :show, params: {id: employe.to_param}, session: valid_session
      expect(assigns(:employe)).to eq(employe)
    end
  end

  describe "GET #new" do
    it "assigns a new employe as @employe" do
      organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
      get :new, params: {:organisme_id => 1}, session: valid_session
      expect(assigns(:employe)).to be_a_new(Employe)
      expect(organisme.name).to respond_to
      expect(organisme.id).to respond_to
    end
  end

  describe "GET #edit" do
    it "assigns the requested employe as @employe" do
      organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
      expect(organisme.name).to respond_to
      expect(organisme.id).to respond_to
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Employe" do
        expect {
          organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
          post :create, params: {employe: valid_attributes, :organisme_id => 1}, session: valid_session
        }.to change(Employe, :count).by(1)
      end

      it "assigns a newly created employe as @employe" do
        organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
        post :create, params: {employe: valid_attributes, :organisme_id => 1}, session: valid_session
        expect(assigns(:employe)).to be_a(Employe)
        expect(assigns(:employe)).to be_persisted
      end

      it "redirects to the created employe" do
        organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
        post :create, params: {employe: valid_attributes, :organisme_id => 1}, session: valid_session
        expect(response).to redirect_to(organisme)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved employe as @employe" do
        organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
        post :create, params: {employe: invalid_attributes, :organisme_id => 1}, session: valid_session
        expect(assigns(:employe)).to be_a_new(Employe)
      end

      it "re-renders the 'new' template" do
        organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
        post :create, params: {employe: invalid_attributes, :organisme_id => 1}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { "nom" => "name2"}
      }

      it "updates the requested employe" do
        organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
        employe = Employe.create! valid_attributes
        put :update, params: {id: employe.to_param, employe: new_attributes}, session: valid_session
        employe.reload
        expect(assigns(:employe)).to eq(employe)
      end

      it "assigns the requested employe as @employe" do
          organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
        employe = Employe.create! valid_attributes
        put :update, params: {id: employe.to_param, employe: valid_attributes}, session: valid_session
        expect(assigns(:employe)).to eq(employe)
      end

      it "redirects to the employe" do
          organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
        employe = Employe.create! valid_attributes
        put :update, params: {id: employe.to_param, employe: valid_attributes}, session: valid_session
        expect(response).to redirect_to(employe)
      end
    end

    context "with invalid params" do
      it "assigns the employe as @employe" do
        organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
        employe = Employe.create! valid_attributes
        put :update, params: {id: employe.to_param, employe: invalid_attributes}, session: valid_session
        expect(assigns(:employe)).to eq(employe)
      end

      it "re-renders the 'edit' template" do
        organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
        employe = Employe.create! valid_attributes
        put :update, params: {id: employe.to_param, employe: invalid_attributes }, session: valid_session
        expect(response).to redirect_to(employe)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested employe" do
      organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
      employe = Employe.create! valid_attributes
      expect {
        delete :destroy, params: {id: employe.to_param}, session: valid_session
      }.to change(Employe, :count).by(-1)
    end

    it "redirects to the employes list" do
      organisme = Organisme.create(:name => 'test', :mail => 'test@test.com', :id => 1)
      employe = Employe.create! valid_attributes
      delete :destroy, params: {id: employe.to_param}, session: valid_session
      expect(response).to redirect_to(employes_url)
    end
  end

end
