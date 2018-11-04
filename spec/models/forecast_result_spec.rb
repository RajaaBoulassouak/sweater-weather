require 'rails_helper'

describe ForecastResult do
  it 'exists' do
    forecast_result = ForecastResult.new

    expect(forecast_result).to be_a(ForecastResult)
  end
  
  it 'has coordinates' do 
    location = 'denver,co'
    forecast_result = ForecastResult.new
    
    expect(forecast_result.coordinates).to eq({:lat=>39.7392358, :lng=>-104.990251})
  end 
  
  it 'has weather forecast data' do 
    forecast_result = ForecastResult.new
    
    expect(forecast_result.weather_forecast).to be_a(Forecast) 
  end
end