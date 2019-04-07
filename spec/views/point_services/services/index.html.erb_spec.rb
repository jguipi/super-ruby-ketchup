require 'rails_helper'

RSpec.describe "services/index", type: :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        :nom => "Nom",
        :description => "Description",
        :tarification => 2.5,
        :estSubventionner => "",
        :tarificationCISSS => 3.5
      ),
      Service.create!(
        :nom => "Nom",
        :description => "Description",
        :tarification => 2.5,
        :estSubventionner => "",
        :tarificationCISSS => 3.5
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
