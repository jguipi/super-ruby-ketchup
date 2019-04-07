require 'rails_helper'

RSpec.describe "educations/new", type: :view do
  before(:each) do
    assign(:education, Education.new(
      :type_education => "Test",
      :name => "MyString",
      :employe => nil
    ))
  end

  it "renders new education form" do
    render

    assert_select "form[action=?][method=?]", educations_path, "post" do

      assert_select "input#education_type_education[name=?]", "education[type_education]"

      assert_select "input#education_name[name=?]", "education[name]"

      assert_select "input#education_employe_id[name=?]", "education[employe_id]"
    end
  end
end
