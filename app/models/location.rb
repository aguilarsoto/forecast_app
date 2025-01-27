class Location < ApplicationRecord
  validates :address, presence: true

  geocoded_by :address do |obj,results|
    if geo = results.first
      obj.zipcode = geo.postal_code
    end
  end

  after_validation :geocode
end
