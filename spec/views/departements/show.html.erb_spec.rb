require 'rails_helper'

RSpec.describe "departements/show", type: :view do
  before(:each) do
    @departement = assign(:departement, Departement.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
