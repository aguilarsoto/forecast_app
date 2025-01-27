class WeathergovService

  def self.call(latitude, longitude)
    response = Faraday.get("https://api.weather.gov/gridpoints/TOP/#{latitude},#{longitude}/forecast")
    body = JSON.parse response.body
    body or raise IOError.new "weather.gov error response"

    response = []

    if body['properties']['periods']
      body['properties']['periods'].each do |period|
       response.push({
         name: period['name'],
         temperature: period['temperature'],
         unit: period['temperatureUnit']})
      end
    end
    response
  end

end
