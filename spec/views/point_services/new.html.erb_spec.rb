require 'rails_helper'

RSpec.describe "point_services/new", type: :view do
  before(:each) do
    @organisme = Organisme.create!(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
    assign(:point_service, PointService.new(
      :nom => "MyString",
      :courriel => "MyString",
      :fax => "MyString",
      :organisme => @organisme
    ))
  end

  it "renders new point_service form" do
    render

    assert_select "form[action=?][method=?]", point_services_path, "post" do

      assert_select "input#point_service_nom[name=?]", "point_service[nom]"

      assert_select "input#point_service_courriel[name=?]", "point_service[courriel]"

      assert_select "input#point_service_fax[name=?]", "point_service[fax]"
    end
  end
end
