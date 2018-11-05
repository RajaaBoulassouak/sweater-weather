class Api::V1::ForecastController < ApplicationController 
  
  def index
    forecast_facade = ForecastFacade.new(params[:location])
    render json: forecast_facade.weather_forecast
  end
end 
