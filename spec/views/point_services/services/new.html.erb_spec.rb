require 'rails_helper'

RSpec.describe "services/new", type: :view do
  before(:each) do
    assign(:service, Service.new(
      :nom => "MyString",
      :description => "MyString",
      :tarification => 1.5,
      :estSubventionner => "",
      :tarificationCISSS => 1.5
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input#service_nom[name=?]", "service[nom]"

      assert_select "input#service_description[name=?]", "service[description]"

      assert_select "input#service_tarification[name=?]", "service[tarification]"

      assert_select "input#service_estSubventionner[name=?]", "service[estSubventionner]"

      assert_select "input#service_tarificationCISSS[name=?]", "service[tarificationCISSS]"
    end
  end
end
