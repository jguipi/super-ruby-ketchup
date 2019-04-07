require 'rails_helper'

RSpec.describe "point_services/edit", type: :view do
  before(:each) do
    @organisme = Organisme.create!(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
    @point_service = assign(:point_service, PointService.create!(
      :nom => "MyString",
      :courriel => "MyString",
      :fax => "MyString",
      :organisme => @organisme
    ))
  end

  it "renders the edit point_service form" do
    render

    assert_select "form[action=?][method=?]", point_service_path(@point_service), "post" do

      assert_select "input#point_service_nom[name=?]", "point_service[nom]"

      assert_select "input#point_service_courriel[name=?]", "point_service[courriel]"

      assert_select "input#point_service_fax[name=?]", "point_service[fax]"
    end
  end
end
