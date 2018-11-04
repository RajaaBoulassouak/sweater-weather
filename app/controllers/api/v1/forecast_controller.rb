class Api::V1::ForecastController < ApplicationController 
  
  def index
    forecast_result = ForecastResult.new(params[:location])
    render json: forecast_result.weather_forecast
  end
end 
