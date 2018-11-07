class Api::V1::BackgroundsController < ApplicationController 
  
  def index
    forecast_facade = ForecastFacade.new(params[:location])
    render json: forecast_facade.forecast_backgrounds
  end
end 
