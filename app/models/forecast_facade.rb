class ForecastFacade 
  
  def initialize(params = {})
    @params = params
  end
  
  def coordinates
    data = geocode_service.get_coordinates(@params)
    data[:results].first[:geometry][:location]
  end
  
  def weather_forecast
    data = darksky_service.get_forecast(coordinates)
  end
  
  def weather_gifs
    summary = "Mostly sunny in the morning"
    data = giphy_service.get_gifs(summary)
    # data[:data].first[:url]
  end
  
  private 
  
  def geocode_service 
    GeocodeService.new
  end
  
  def darksky_service
    DarkskyService.new
  end
  
  def giphy_service
    GiphyService.new
  end
end