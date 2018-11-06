class Api::V1::GifsController < ApplicationController 
  
  def index
    forecast_facade = ForecastFacade.new(params[:location])
    render json: forecast_facade.weather_gifs
  end
end 
