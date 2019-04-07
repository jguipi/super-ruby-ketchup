require 'rails_helper'

RSpec.describe "services/edit", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :nom => "MyString",
      :description => "MyString",
      :tarification => 1.5,
      :estSubventionner => "",
      :tarificationCISSS => 1.5
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "input#service_nom[name=?]", "service[nom]"

      assert_select "input#service_description[name=?]", "service[description]"

      assert_select "input#service_tarification[name=?]", "service[tarification]"

      assert_select "input#service_estSubventionner[name=?]", "service[estSubventionner]"

      assert_select "input#service_tarificationCISSS[name=?]", "service[tarificationCISSS]"
    end
  end
end
