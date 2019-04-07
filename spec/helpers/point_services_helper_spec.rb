require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PointServicesHelper. For example:
#
# describe PointServicesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PointServicesHelper, type: :helper do
  describe "check_if_ptservice_contains_departement" do
    it "checks if a service point contains a departments" do
      @organisme = Organisme.create!(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
      departement = Departement.create(:description => "Dep")
      pointService = PointService.create(:nom => "UnNom", :courriel => "uncourriel@gmail.com", :organisme => @organisme)
      pointService.departements << departement
      logger.debug 'departements count : ' + pointService.departements.count.to_s()
      expect(helper.check_if_ptservice_contains_departement(pointService, departement.id)).to eq("checked")
    end
  end

  describe "check_if_ptservice_ does not contains_departement" do
    it "checks if a service point does not contain a departments" do
      departement = Departement.new(:description => "Dep")
      pointService = PointService.new
      expect(helper.check_if_ptservice_contains_departement(pointService, departement.id)).to eq("")
    end
  end

  describe "check_if_ptService_contains_departement_name_blank" do
    it "checks if a service point contains a departments" do
      @organisme = Organisme.create!(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
      departement = Departement.create(:description => "Dep")
      pointService = PointService.create(:nom => "", :courriel => "uncourriel@gmail.com", :organisme => @organisme)
      logger.debug 'departements count : ' + pointService.departements.count.to_s()
      expect(helper.check_if_ptservice_contains_departement(pointService, departement.id)).to eq("")
    end
  end

  describe "Departement is NOT in organisme that doesnt have a name (invalid organisme)" do
    it "checks if the generated departement not in a invalid organisme" do
      @organisme = Organisme.create!(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
      departement = Departement.create(:description => "Dep")
      pointService = PointService.create!(:nom => "UnNom", :courriel => "uncourriel@gmail.com", :organisme => @organisme)
      pointService.nom = ""
      expect(helper.check_if_ptservice_contains_departement(pointService, departement.id)).to eq("")
    end
  end
end
