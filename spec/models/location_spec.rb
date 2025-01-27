require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should validate_presence_of :address }

  describe "forecast" do
    let(:location) { FactoryBot.create(:location, zipcode: '31404') }

    it "should query weather.gov to obtain the forecast" do
      response_dbl = instance_double('Faraday::Response')
      allow(Faraday).to receive(:get).and_return(response_dbl)
      allow(response_dbl).to receive(:body)
        .and_return('{"properties": {"periods": [{"name": "foo", "temperature": 44, "temperatureUnit": "F"}]}}')
      expect(location.forecast).to eq([{name: "foo", temperature: 44, unit: "F"}])
    end
  end

  describe "cached_forecast" do
    let(:location) { FactoryBot.create(:location, zipcode: '31404') }

    it "should query weather.gov to obtain the forecast" do
      allow(Rails.cache).to receive(:exist?).and_return(true)
      expect(location.cached_forecast?).to be_truthy
    end

  end

end
