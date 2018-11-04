require 'rails_helper'

describe ForecastResult do
  it 'exists' do
    forecast_result = ForecastResult.new

    expect(forecast_result).to be_a(ForecastResult)
  end
  
  describe 'Instance Methods' do
    it 'has coordinates' do 
      forecast_result = ForecastResult.new
      
      expect(forecast_result.coordinates).to eq({:lat=>39.5500507, :lng=>-105.7820674})
    end 
    
    it 'has weather forecast data' do 
      location = 'denver,co'
      forecast_result = ForecastResult.new
      
      expect(forecast_result.weather_forecast).to be_a(Forecast) 
    end
  end
end