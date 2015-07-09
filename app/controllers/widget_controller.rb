class WidgetController < ApplicationController
  include WidgetHelper

  def index
    @weather = get_weather
    @forecast = get_forecast
  end
end
