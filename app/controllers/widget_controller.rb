class WidgetController < ApplicationController
  include WidgetHelper

  def index
    @ip = request.remote_ip
    @weather = get_weather(@ip)
    if @weather["error"]
      redirect_to "/error" and return
    end
    @forecast = get_forecast
    @icon = get_icon(@weather)
  end

  def yahoo
  end

  def error
    @error = get_weather(request.remote_ip)["error"]
    @ip = request.remote_ip
  end

end
