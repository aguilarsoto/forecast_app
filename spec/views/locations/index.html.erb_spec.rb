require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      FactoryBot.create(:location),
      FactoryBot.create(:location)
    ])
  end

  it "renders a list of locations" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("12 E 54th st savannah GA, 31405".to_s), count: 2
  end
end
