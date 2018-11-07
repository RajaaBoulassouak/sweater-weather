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
    Forecast.new(data)
  end
  
  def forecast_backgrounds
    data = flickr_service.get_backgrounds(coordinates)
    images_array = []
    data[:photos][:photo].map do |hash|
      image_hash = {}
      hash.map do |key, value|
        if key == :url_o
          image_hash[:image_url] = value
        end 
      end
      images_array << image_hash
    end 
    images_array.uniq
  end
  
  private 
  
  def geocode_service 
    GeocodeService.new
  end
  
  def darksky_service
    DarkskyService.new
  end
  
  def flickr_service
    FlickrService.new
  end
end