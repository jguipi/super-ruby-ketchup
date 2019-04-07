require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ServicesHelper. For example:
#
# describe ServicesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ServicesHelper, type: :helper do
  describe "check_service_id" do
    it "Checks if the service id string constructed is alright" do
      expect(helper.service_id("service", '1')).to eq("service_1")
    end
  end
end
