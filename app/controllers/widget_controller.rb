class WidgetController < ApplicationController
  include WidgetHelper

  def index
    @weather = get_weather
    if @weather["error"]
      redirect_to "/error" and return
    end
    @forecast = get_forecast
    @icon = get_icon(@weather)
  end

  def yahoo
  end

  def error
    @error = get_weather["error"]
  end

end
