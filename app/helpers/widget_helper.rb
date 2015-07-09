module WidgetHelper
  def get_weather
    response = HTTParty.get('http://api.wunderground.com/api/416ff8fce0c84725/conditions/q/IL/Chicago.json')
    weather = {
      "location" => response["current_observation"]["display_location"]["full"],
      "temp_f" => response["current_observation"]["temp_f"],
      "temp_c" => response["current_observation"]["temp_c"],
      "condition" => response["current_observation"]["weather"]
    }
    return weather
  end

  def get_forecast
    response = HTTParty.get('http://api.wunderground.com/api/416ff8fce0c84725/forecast/q/IL/Chicago.json')
    forecast = response['forecast']["simpleforecast"]['forecastday'][0..2]
    return forecast
  end

  def get_icon(weather)
    if weather["condition"].include? "sun"
      icon = "sunny.png"
    elsif weather["condition"].include? "cloud"
      icon = ""
    elsif weather["condition"].include? "rain"
      icon = ""
    elsif weather["condition"].include? "storm"
      icon = ""
    elsif weather["condition"].include? "snow"
      icon = ""
    end
  end

end
