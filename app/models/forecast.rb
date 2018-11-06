class Forecast 

  def initialize(data)
    @daily       =  daily_forecast(data)         
    @timezone    =  data[:timezone]
  end 
  
  def weather_gifs
    summary = "Mostly sunny in the morning"
    data = giphy_service.get_gifs(summary)
    # data[:data].first[:url]
  end
  
  def giphy_service
    GiphyService.new
  end
  
  def daily_forecast(data)
    details = {}
    images = []
    # require "pry"; binding.pry
    data[:daily][:data].map do |day|
      hash = {}
      day.map do |key, value|
        if key == :summary || key == :time
          hash[key] = value
        end
      end 
      images << hash
    end
    images
  end
end 