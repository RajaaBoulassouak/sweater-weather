class ForecastResult 
  
  location = 'denver,co'
  
  def coordinates
    data = geocode_service.get_coordinates(location)
    data[:results].first[:geometry][:location]
  end
  
  def lat_and_long
    lat = coordinates[:lat]
    long = coordinates[:lng]
  end
  
  private 
  
  def geocode_service 
    GeocodeService.new
  end
end