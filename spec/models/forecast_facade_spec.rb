require 'rails_helper'

describe ForecastFacade do
  it 'exists' do
    forecast_facade = ForecastFacade.new

    expect(forecast_facade).to be_a(ForecastFacade)
  end
  
  describe 'Instance Methods' do
    it 'has coordinates' do
      location = 'denver,co' 
      forecast_facade = ForecastFacade.new(location)
      
      expect(forecast_facade.coordinates).to eq({:lat=>39.7392358, :lng=>-104.990251})
    end 
    
    it 'has weather forecast data' do 
      location = 'denver,co'
      forecast_facade = ForecastFacade.new(location)

      expect(forecast_facade.weather_forecast).to be_a(Forecast) 
    end
  end
end