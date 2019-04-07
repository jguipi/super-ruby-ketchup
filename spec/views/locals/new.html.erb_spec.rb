require 'rails_helper'

RSpec.describe "locals/new", type: :view do
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
    @point_service_id = @point_service.id
    assign(:local, Local.new(
      :nom => "MyString",
      :nombrePlaces => "",
      :point_service_id => @point_service.id
    ))
  end

  it "renders new local form" do
    render

    assert_select "form[action=?][method=?]", locals_path, "post" do

      assert_select "input#local_nom[name=?]", "local[nom]"

      assert_select "input#local_nombrePlaces[name=?]", "local[nombrePlaces]"
    end
  end
end
