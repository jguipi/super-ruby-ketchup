require 'rails_helper'

RSpec.describe "educations/index", type: :view do
  before(:each) do
    assign(:educations, [
      Education.create!(
        :type_education => "Type",
        :name => "Name",
        :employe => nil
      ),
      Education.create!(
        :type_education => "Type",
        :name => "Name",
        :employe => nil
      )
    ])
  end

  it "renders a list of educations" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 4
  end
end
