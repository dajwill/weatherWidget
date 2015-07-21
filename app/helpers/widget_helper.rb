module WidgetHelper
  def get_weather
    # response = HTTParty.get('http://api.wunderground.com/api/416ff8fce0c84725/conditions/q/IL/Chicago.json')
    # bad request
    response = HTTParty.get('http://api.wunderground.com/api/416ff8fce0c8472/conditions/q/IL/Chicago.json')
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

  def get_icon(weather)
    {
      "SUN" => "sunny.png",
      "CLOUD" => "cloudy.png",
      "RAIN" => "rainy.png",
      "STORM" => "storm.png",
      "SNOW" => "snowy.png"
    }[weather["conditions"].upcase] || "sunny.png"
  end

end
