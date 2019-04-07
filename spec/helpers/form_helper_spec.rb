require 'rails_helper'

RSpec.describe FormHelper, type: :helper do
  describe "Set up referent" do
    it "add a telephone to the referent" do
      organisme = Organisme.create(:name => "Orga", :mail => "orga@yahoo.com")
      referent = Referent.create(:nom => "Marc", :prenom => "Anto", :courriel => "marc@gmail.com", :organisme_id => organisme)
      expect helper.setup_referent(referent).telephones.first.nil?
    end
  end

  describe "Validate Referent ID" do
    it "Checks if valid" do
      organisme = Organisme.create(:name => "Orga", :mail => "orga@yahoo.com")
      refid = "1234567890123456789"
      referent = Referent.create(:nom => "Marc", :prenom => "Anto", :courriel => "marc@gmail.com", :organisme_id => organisme, :refid => refid)
      #validated_id = helper.validate_id(referent[:refid].to_s)
      expect(
        helper.validate_id(refid)
       ).to match refid

    end

    it "Checks if not valid" do
      organisme = Organisme.create(:name => "Orga", :mail => "orga@yahoo.com")
      refid = "1234567890123456789111"
      referent = Referent.create(:nom => "Marc", :prenom => "Anto", :courriel => "marc@gmail.com", :organisme_id => organisme, :refid => refid)
      #validated_id = helper.validate_id(referent[:refid].to_s)
      expect(
        helper.validate_id(referent.refid.to_s)
      ).to match false

    end
  end
end