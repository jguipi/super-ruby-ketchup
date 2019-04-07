require 'rails_helper'

RSpec.describe "educations/edit", type: :view do
  before(:each) do
    @education = assign(:education, Education.create!(
      :type_education => "Secondaire",
      :name => "MyString",
      :employe => nil
    ))
  end

  it "renders the edit education form" do
    render

    assert_select "form[action=?][method=?]", education_path(@education), "post" do

      assert_select "input#education_type_education[name=?]", "education[type_education]"

      assert_select "input#education_name[name=?]", "education[name]"

      assert_select "input#education_employe_id[name=?]", "education[employe_id]"
    end
  end
end
