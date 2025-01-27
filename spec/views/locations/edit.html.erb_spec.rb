require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  let(:location) {
    FactoryBot.create(:location)
  }

  before(:each) do
    assign(:location, location)
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(location), "post" do

      assert_select "input[name=?]", "location[address]"
    end
  end
end
