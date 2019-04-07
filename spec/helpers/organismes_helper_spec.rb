require 'rails_helper'

RSpec.describe PointServicesHelper, type: :helper do
  describe "Departement is in organisme" do
    it "checks if the generated departement is in organisme" do
      @organisme = Organisme.create!(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
      departement = Departement.create(:description => "Dep")
      @organisme.departements << departement
      expect(helper.check_if_contains_departement(@organisme, departement.id)).to eq("checked")
    end
  end

  describe "Departement is NOT in organisme" do
    it "checks if the generated departement not in the organisme when we dont add it" do
      @organisme = Organisme.create!(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
      departement = Departement.create(:description => "Dep")
      expect(helper.check_if_contains_departement(@organisme, departement.id)).to eq("")
    end
  end

  describe "Departement Get string id" do
    it "checks if the generated string id is fine" do
      expect(helper.departement_id("finance", "1")).to eq("finance_1")
    end
  end

  describe "Departement is NOT in organisme that doesnt exist anyway" do
    it "checks if the generated departement not in a dirty organisme" do
      @organisme = Organisme.new(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
      departement = Departement.create(:description => "Dep")
      expect(helper.check_if_contains_departement(@organisme, departement.id)).to eq("")
    end
  end

  describe "Departement is NOT in organisme that doesnt have a name (invalid organisme)" do
    it "checks if the generated departement not in a invalid organisme" do
      @organisme = Organisme.create(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
      @organisme.name = ""
      departement = Departement.create(:description => "Dep")
      expect(helper.check_if_contains_departement(@organisme, departement.id)).to eq("")
    end
  end
end