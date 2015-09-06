class Weather
  attr_reader :request_location, :city, :state, :response
  def initialize ip
    if ip == '127.0.0.1'
      ip = '68.42.67.216'
    end
    @request_location = HTTParty.get("http://www.telize.com/geoip/#{ip}")
    @state = request_location['region_code']
    city = request_location['city']
    @city = city.gsub(' ', '_')
  end

  def response
    {
      'conditions' => HTTParty.get("http://api.wunderground.com/api/cd37d9950ffc6fbd/conditions/q/#{@state}/#{@city}.json"),
      'forecast' => HTTParty.get("http://api.wunderground.com/api/cd37d9950ffc6fbd/forecast/q/#{@state}/#{@city}.json"),
      'hourly' => HTTParty.get("http://api.wunderground.com/api/cd37d9950ffc6fbd/hourly/q/#{@state}/#{@city}.json")
    }
  end
end
