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
    image_array = []
    weather_forecast.map do |hash|
      hash.map do |key, value|
        if key == :summary
          gif = giphy_service.get_gifs(key)
        end
        image_array << gif 
      end 
    end
    image_array.compact
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