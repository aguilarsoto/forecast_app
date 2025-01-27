class Location < ApplicationRecord
  validates :address, presence: true

  geocoded_by :address do |obj,results|
    if geo = results.first
      obj.zipcode = geo.postal_code
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end

  after_validation :geocode

  def forecast
    return [] if latitude.nil? || longitude.nil? || zipcode.nil?
    return Rails.cache.fetch(zipcode, expires_in: 30.minutes) do
      WeathergovService.call(latitude.abs.to_i, longitude.abs.to_i)
    end
  end

  def cached_forecast?
    return false if zipcode.nil?
    Rails.cache.exist?(zipcode)
  end
end
