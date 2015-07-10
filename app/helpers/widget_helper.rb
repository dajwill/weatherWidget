module WidgetHelper
  def get_weather
    response = HTTParty.get('http://api.wunderground.com/api/416ff8fce0c84725/conditions/q/IL/Chicago.json')
    weather = {
      "location" => response["current_observation"]["display_location"]["full"],
      "temp_f" => response["current_observation"]["temp_f"],
      "temp_c" => response["current_observation"]["temp_c"],
      "conditions" => response["current_observation"]["weather"]
    }
    return weather
  end

  def get_forecast
    response = HTTParty.get('http://api.wunderground.com/api/416ff8fce0c84725/forecast/q/IL/Chicago.json')
    forecast = response['forecast']["simpleforecast"]['forecastday'][0..2]
    return forecast
  end

  def get_icon(weather)
    if weather["conditions"].include? "Sun"
      icon = "sunny.png"
    elsif weather["conditions"].include? "Cloud"
      icon = "cloudy.png"
    elsif weather["conditions"].include? "Rain"
      icon = "rainy.png"
    elsif weather["conditions"].include? "Storm"
      icon = "storm.png"
    elsif weather["conditions"].include? "Snow"
      icon = "snowy.png"
    else
      icon = "sunny.png"
    end
    return icon
  end

end
