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
    urls_array = []
    image_array.compact.map do |hash|
      url_hash = {}
      hash.map do |key, value|
        if key == :data 
          url_hash[:url] = hash[:data].first[:url]
        end 
        urls_array << url_hash
      end 
    end 
    require "pry"; binding.pry
    urls_array
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