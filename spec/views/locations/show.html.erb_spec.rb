require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    assign(:location, FactoryBot.create(:location))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match("12 E 54th st savannah GA, 31405")
  end
end
