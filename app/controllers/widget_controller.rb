class WidgetController < ApplicationController
  include WidgetHelper
  after_action :allow_iframe, only: :embed

  def index
    @weather = get_weather
    @forecast = get_forecast
    @icon = get_icon(@weather)
  end

  def embed
  end

private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
