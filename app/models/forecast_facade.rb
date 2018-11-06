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
    data[:daily][:data].map do |day|
      hash = {}
      day.map do |key, value|
        if key == :summary || key == :time
          hash[key] = value
        end
      end 
      hash
    end
  end
  
  def weather_gifs
    summary = "Mostly sunny in the morning"
    data = giphy_service.get_gifs(summary)
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