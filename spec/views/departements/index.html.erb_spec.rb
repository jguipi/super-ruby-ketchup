require 'rails_helper'

RSpec.describe "departements/index", type: :view do
  before(:each) do
    assign(:departements, [
      Departement.create!(
        :description => "Description"
      ),
      Departement.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of departements" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
