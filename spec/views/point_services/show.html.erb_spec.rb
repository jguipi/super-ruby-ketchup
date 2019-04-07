require 'rails_helper'

RSpec.describe "point_services/show", type: :view do
  before(:each) do
    @organisme = Organisme.create!(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
    @point_service = PointService.new()
    @adr = Adresse.create(:rue => "rue", :ville => "ville", :pays => "pays", :codePostal => "codepostal", :point_service => @point_service)
    @point_service = assign(:point_service, PointService.create!(
      :nom => "Nom",
      :courriel => "Courriel",
      :fax => "Fax",
      :organisme => @organisme,
      :adresse => @adr
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/Courriel/)
    expect(rendered).to match(/Fax/)
  end
end
