class ForecastResult 
  
  location = 'denver,co'
  
  def coordinates
    data = geocode_service.get_coordinates(location)
    data[:results].first[:geometry][:location]
  end
  
  def weather_forecast
    data = darksky_service.get_forecast(coordinates)
    Forecast.new(data)
  end
  
  private 
  
  def geocode_service 
    GeocodeService.new
  end
  
  def darksky_service
    DarkskyService.new
  end
end