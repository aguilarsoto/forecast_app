require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    assign(:location, FactoryBot.create(:location, zipcode: 31404))
  end

  it "renders attributes in <p>" do
    response_dbl = instance_double('Faraday::Response')
    allow(Faraday).to receive(:get).and_return(response_dbl)
    allow(response_dbl).to receive(:body)
      .and_return('{"properties": {"periods": [{"name": "foo", "temperature": 44, "temperatureUnit": "F"}]}}')
    allow(Rails.cache).to receive(:exist?).and_return(true)
    render
    expect(rendered).to match("12 E 54th st savannah GA, 31405")
    expect(rendered).to match("foo: 44 F")
    expect(rendered).to match("cached")
  end
end
