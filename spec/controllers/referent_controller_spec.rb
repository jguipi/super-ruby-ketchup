require 'rails_helper'

RSpec.describe ReferentsController, type: :controller do

  let(:valid_attributes_wo_organisme) {
    {
        :prenom => "Vincent",
        :nom => "Vincent",
        :refid => "696969",
        :fax => "",
        :title => "Master",
        :departement => "best departement",
        :preferenceContact => "",
        :organisme_id => "",
        :courriel => "vincent@vincent.vincent",
        "telephones_attributes" => {
            "0" => {
                "number" => "696-969-6969", "numberType" => "domicile"
            }
        }
    }
  }
  let(:valid_attributes_w_organisme) {
    {
        :prenom => "Vincent",
        :nom => "Vincent",
        :refid => "696969",
        :fax => "",
        :title => "Master",
        :departement => "best departement",
        :preferenceContact => "",
        :organisme_id => @org.id,
        :courriel => "vincent@vincent.vincent",
        "telephones_attributes" => {
            "0" => {
                "number" => "696-969-6969", "numberType" => "domicile"
            }
        }
    }
  }
  let(:invalid_attributes) {
    {
        :prenom => "Vincent",
        :nom => "Vincent",
        :refid => "696969",
        :fax => "",
        :title => "",
        :departement => "",
        :oreferenceContact => "",
        :organisme_id => "",
        :courriel => "",
        "telephones_attributes" => {
            "0" => {
                "number" => "696-969-6969", "numberType" => "domicile"
            }
        }
    }
  }
  let(:valid_attributes_for_organisme) {
    {
        :name => "orgtest",
        :mail => "test@test.com"
    }
  }
  let(:valid_session){
    { }
  }

  describe "GET Index" do
    it "gets the index view" do
      get "index"
      expect(response.status).to be 200
    end

    it "gets the correct index view template" do
      get "index"
      expect(response).to render_template("referents/index")
    end
  end

  describe "#create" do
    before(:each) do
      @org = Organisme.create! valid_attributes_for_organisme
    end
    it "referent w/o organisme" do
      expect {
        post :create, params: {referent: valid_attributes_wo_organisme}, session: valid_session
      }.to change(Referent, :count).by(1)
    end
    it "referent w/ organisme" do
      expect {
        post :create, params: {referent: valid_attributes_w_organisme}, session: valid_session
      }.to change(Referent, :count).by(1)
    end
    it "fails to create refent" do
      expect {
        post :create, params: {referent: invalid_attributes}, session: valid_session
      }.to change(Referent, :count).by(0)
    end
  end

  describe "#new" do
    @controller = ReferentsController.new
    it "creates a new referent" do
      @controller.new
      expect(
          @controller.instance_variable_get(:@options)
      ).not_to be_nil
    end
  end

  describe "#search" do
    it "expect to find the query" do
      Referent.create! valid_attributes_wo_organisme
      get :index, params: {query: "vincent"}, session: valid_session
      expect(
          :@referents
      ).to be_truthy
    end
  end

  describe "#edit" do
    it "reders the edit page" do
      referent = Referent.create! valid_attributes_wo_organisme
      get :edit, params: {id: referent.to_param}, session: valid_session
      expect(assigns(:referent)).to eq(referent)
    end
  end

  describe "#update" do
    before(:each) {
      @org = Organisme.create! valid_attributes_for_organisme
      @referent = Referent.create! valid_attributes_w_organisme
    }
    let(:new_attributes) {
      {
          prenom: "vnicent",
          nom: "vicnent",
          courriel: "vnicent@vicnent.vincent",
          organisme_id: @org.id
      }
    }
    let(:new_attributes_w_extra_param){
      {
          prenom: "vnicent",
          nom: "vicnent",
          courriel: "vnicent@vicnent.vincent",
          organisme_id: @org.id,
          scary_internet_parameter: "Boo"
      }
    }
    context "with valid params" do
      it "updates the requested referent" do
        put :update, params: {id: @referent.id, referent: new_attributes, commit: "Enregistrer"}, session: valid_session
        @referent.reload
        expect(response.status).to be 302
      end

      it "assigns the requested referent as @referent" do
        patch :update, params: {id: @referent.id, referent: new_attributes, commit: "Enregistrer"}, session: valid_session
        expect(assigns(:referent)).to eq(@referent)
      end

      it "redirects to the referent" do
        patch :update, params: {id: @referent.id, referent: new_attributes, commit: "Enregistrer"}, session: valid_session
        expect(response).to redirect_to(@referent)
      end

    end

  end

  describe "#destroy" do
    before {
      @org = Organisme.create! valid_attributes_for_organisme
      @referent = Referent.create! valid_attributes_w_organisme
    }
    it "deletes the referent" do
      expect{
        delete :destroy, params: {id: @referent.id}, session: valid_session
      }.to change(Referent, :count).by(-1)
    end
  end

  # describe "#setReferent" do
  #   it "gets all referents" do
  #     @controller = ReferentsController.new
  #
  #     @controller.send(:set_referent)
  #     expect{
  #       @referent
  #     }.to eq Referent.find(params[:id])
  #   end
  # end


end
