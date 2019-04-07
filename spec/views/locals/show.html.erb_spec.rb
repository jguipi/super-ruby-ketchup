require 'rails_helper'

RSpec.describe "locals/show", type: :view do
  before(:each) do
    @organisme = Organisme.create!(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
    @organisme_id = @organisme.id
    @point_service = assign(:point_service, PointService.create!(
        :nom => "Nom",
        :courriel => "Courriel",
        :fax => "Fax",
        :organisme => @organisme,
        :adresse => @adr
    ))
    @local = assign(:local, Local.create!(
        :nom => "MyString",
        :nombrePlaces => "",
        :point_service_id => @point_service.id
    ))
    @point_service_id = @point_service.id
  end

=begin
  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(//)
  end
=end
end
