require 'rails_helper'

RSpec.describe "departements/new", type: :view do
  before(:each) do
    assign(:departement, Departement.new(
      :description => "MyString"
    ))
  end

  it "renders new departement form" do
    render

    assert_select "form[action=?][method=?]", departements_path, "post" do

      assert_select "input#departement_description[name=?]", "departement[description]"
    end
  end
end
