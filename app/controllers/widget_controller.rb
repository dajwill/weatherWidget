class WidgetController < ApplicationController
  include WidgetHelper
  include TestHelper

  # test = get_weather

  def index
    @weather = get_weather
    if @weather["error"]
      redirect_to "http://www.rubyonrails.org" and return
    end
    @forecast = get_forecast
    @icon = get_icon(@weather)
  end

  def yahoo
  end

  # def api_check response
  #   if response["response"]["error"]
  #     redirect_to "http://www.rubyonrails.org"
  #   end
  # end
end
