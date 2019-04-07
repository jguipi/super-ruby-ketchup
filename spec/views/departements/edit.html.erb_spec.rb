require 'rails_helper'

RSpec.describe "departements/edit", type: :view do
  before(:each) do
    @departement = assign(:departement, Departement.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit departement form" do
    render

    assert_select "form[action=?][method=?]", departement_path(@departement), "post" do

      assert_select "input#departement_description[name=?]", "departement[description]"
    end
  end
end
