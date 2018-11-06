class Api::V1::GifsController < ApplicationController 
  
  def index
    forecast_data = ForecastFacade.new(params[:location])
    forecast = Forecast.new(forecast_data)
    render json: forecast.weather_gifs
  end
end 
