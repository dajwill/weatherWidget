module WeatherNormalizationHelper
  def get_conditions(weather)
    response = weather.response['conditions']
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

  def get_forecast(weather)
    response = weather.response['forecast']['forecast']['simpleforecast']['forecastday'][0..2]
    forecast_array = []
    response.each do |forecast|
      forecast_array << {
        'date' => forecast["date"]["weekday"],
        'high' => forecast["high"]["fahrenheit"],
        'low' => forecast["low"]["fahrenheit"],
        'conditions' => forecast["conditions"]
      }
    end
    return forecast_array
  end

  def get_hourly(weather)
    response = weather.response['hourly']['hourly_forecast'][0..3]
    hourly_array = []
    response.each do |hour|
      hourly_array << {
        'time' => hour['FCTTIME']['civil'],
        'temp' => hour['temp']['english'],
        'condition' => hour['condition'],
      }
    end
    return hourly_array
  end

  def get_yahoo_weather
    # create a secondary weather hash if wunderground request fails
  end

  def get_icon(weather)
    icon = "sun@2x.png"
    condition = weather["conditions"].upcase
    conditions_array = ["SUN", "CLOUD", "RAIN", "STORM", "SNOW"]
    x = ["SUN", "CLOUD", "RAIN", "STORM", "SNOW"]
    icons_array = ["sun@2x.png", "cloudy@2x.png", "rain@2x.png", "storm@2x.png", "heavyfrost@2x.png"]
    x.each_with_index do |i, index|
      if condition.include? i
        icon = icons_array[index]
      end
    end
    return icon
  end

end
