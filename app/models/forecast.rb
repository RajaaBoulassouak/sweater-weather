class Forecast 

  def initialize(data)
    @daily       =  daily_forecast(data)         
    @latitude    =  data[:latitude]
    @longitude   =  data[:longitude]

    @summary     =  data[:currently][:summary]
    @icon        =  data[:currently][:icon]
    @temperature =  data[:currently][:temperature]
    @feel_slike  =  data[:currently][:apparentTemperature]
    @humidity    =  data[:currently][:humidity]
    @visibility  =  data[:currently][:visibility]
    @uv_index    =  data[:currently][:uvIndex]
    @today       =  data[:hourly][:summary]
    @high        =  @daily.first[:temperatureHigh]
    @low         =  @daily.first[:temperatureLow]
  end 
  
  def weather_gifs
    summary = "Mostly sunny in the morning"
    data = giphy_service.get_gifs(summary)
    # data[:data].first[:url]
  end
  
  def giphy_service
    GiphyService.new
  end
end 