require 'rails_helper'

RSpec.describe "point_services/index", type: :view do
  before(:each) do
    organisme = Organisme.create!(:name => "Name", :mail => "mail@gmail.com", :telephone => "450-123-4567")
    assign(:point_services, [
      PointService.create!(
        :nom => "Nom",
        :courriel => "Courriel",
        :fax => "Fax",
        :organisme => organisme
      ),
      PointService.create!(
        :nom => "Nom",
        :courriel => "Courriel",
        :fax => "Fax",
        :organisme => organisme
      )
    ])
  end

  it "renders a list of point_services" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Courriel".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
  end
end
