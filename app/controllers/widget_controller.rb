class WidgetController < ApplicationController
  include WidgetHelper
  include TestHelper

  def index
    @weather = get_weather
    @forecast = get_forecast
    @icon = get_icon(@weather)
    @icon_test = icon_test(@icon)
  end
end
