class Api::V1::GifsController < ApplicationController 
  
  def index
    forecast = Forecast.new(params[:location])
    render json: forecast.weather_gifs
  end
end 
