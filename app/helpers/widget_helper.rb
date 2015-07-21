module WidgetHelper
  def get_weather
    # Good request
    response = HTTParty.get('http://api.wunderground.com/api/416ff8fce0c84725/conditions/q/IL/Chicago.json')
    # # bad request
    # response = HTTParty.get('http://api.wunderground.com/api/416ff8fce0c8472/conditions/q/IL/Chicago.json')
    if response["response"]["error"]
      {"error" => response["response"]["error"]}
    else
      {
        "location" => response["current_observation"]["display_location"]["full"],
        "temp_f" => response["current_observation"]["temp_f"],
        "temp_c" => response["current_observation"]["temp_c"],
        "conditions" => response["current_observation"]["weather"],
      }
    end
  end

  def get_forecast
    response = HTTParty.get('http://api.wunderground.com/api/416ff8fce0c84725/forecast/q/IL/Chicago.json')
    forecast = response['forecast']["simpleforecast"]['forecastday'][0..2]
    return forecast
  end

  def get_yahoo_weather
    # create a secondary weather hash if wunderground request fails
  end

  def get_icon(weather)
    icon = "sunny.png"
    condition = weather["conditions"].upcase
    conditions_array = ["SUN", "CLOUD", "RAIN", "STORM", "SNOW"]
    x = ["SUN", "CLOUD", "RAIN", "STORM", "SNOW"]
    icons_array = ["sunny.png", "cloudy.png", "rainy.png", "storm.png", "snowy.png"]
    x.each_with_index do |i, index|
      if condition.include? i
        icon = icons_array[index]
      end
    end
    return icon
  end

end
