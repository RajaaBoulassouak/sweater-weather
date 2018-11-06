class Forecast 

  def initialize(data)
    @hourly      =  hourly_forecast(data)
    @daily       =  daily_forecast(data)         
    @latitude    =  data[:latitude]
    @longitude   =  data[:longitude]
    @timezone    =  data[:timezone]
    @time        =  converted_time(data)
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
  
  def converted_time(data)
    time = data[:currently][:time]
    DateTime.strptime(time.to_s,'%s')
  end
  
  def hourly_forecast(data) 
    hours_array = []
    data[:hourly][:data].map do |hour|
      hour_hash = {}
      hour.map do |key, value|
        if key == :icon || key == :temperature
          hour_hash[key] = value
        elsif
          key == :time
            hour_hash[key] = DateTime.strptime(value.to_s,'%s')
        end
      end
      hours_array << hour_hash
    end
    hours_array
  end
  
  def daily_forecast(data)
    days_array = []
    data[:daily][:data].map do |day|
      day_hash = {}
      day.map do |key, value|
        if key == :summary || key == :icon || key == :precipProbability || key == :precipType || key == :temperatureHigh || key == :temperatureLow
          day_hash[key] = value
        elsif
          key == :time
            day_hash[key] = DateTime.strptime(value.to_s,'%s')
        end 
      end 
      days_array << day_hash
    end
    days_array
  end
end 