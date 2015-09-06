class WidgetController < ApplicationController
  include WeatherNormalizationHelper

  def index
    @ip = request.remote_ip
    @time = Time.new
    @weather = get_weather(@ip)
    if @weather["error"]
      redirect_to "/error" and return
    end
    @forecast = get_forecast
    @icon = get_icon(@weather)
  end

  def yahoo
    ip = request.remote_ip
    weather = Weather.new(ip)
    @conditions = get_conditions(weather)
    @forecast = get_forecast(weather)
    @hourly = get_hourly(weather)
  end

  def error
    @error = get_weather(request.remote_ip)["error"]
    @ip = request.remote_ip
  end

end
