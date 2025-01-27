if Rails.env.test?
  Geocoder.configure(:lookup => :test)
  # Particular Look up
  Geocoder::Lookup::Test.add_stub(
    "12 E 54th st savannah GA, 31405", [
      {
        'latitude'     => 40.7143528,
        'longitude'    => -74.0059731,
        'address'      => 'New York, NY, USA',
        'state'        => 'New York',
        'state_code'   => 'NY',
        'country'      => 'United States',
        'country_code' => 'US',
        'postal_code'  => '31405'
      }
    ]
  )
  Geocoder::Lookup::Test.add_stub(
    "14 E 54th st savannah GA, 31405", [
      {
        'latitude'     => 9.99,
        'longitude'    => -74.0059731,
        'address'      => 'New York, NY, USA',
        'state'        => 'New York',
        'state_code'   => 'NY',
        'country'      => 'United States',
        'country_code' => 'US',
        'postal_code'  => '31405'
      }
    ]
  )




end
