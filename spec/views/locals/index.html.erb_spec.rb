require 'rails_helper'

RSpec.describe "locals/index", type: :view do
  before(:each) do
    assign(:locals, [
      Local.create!(
        :nom => "Nom",
        :nombrePlaces => ""
      ),
      Local.create!(
        :nom => "Nom",
        :nombrePlaces => ""
      )
    ])
  end
end
