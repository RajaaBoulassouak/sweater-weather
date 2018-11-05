class Forecast 

  def initialize(data)
    @latitude    =  data[:latitude]
    @longitude   =  data[:longitude]
    @timezone    =  data[:timezone]
    @summary     =  data[:currently][:summary]
    @icon        =  data[:currently][:icon]
    @temperature =  data[:currently][:temperature]
    @time        =  data[:currently][:time]
    @feel_slike  =  data[:currently][:apparentTemperature]
    @humidity    =  data[:currently][:humidity]
    @visibility  =  data[:currently][:visibility]
    @uv_index    =  data[:currently][:uvIndex]
    @hourly      =  []
    hourly       =  data[:hourly][:data].map do |hour|
                      hours_hash = {}
                      hour.map do |key, value|
                        if key == :time || key == :icon || key == :temperature
                          hours_hash[key] = value
                        end
                      end
                      @hourly << hours_hash
                    end
    @daily       =  []
    daily        =  data[:daily][:data].map do |day|
                      days_hash = {}
                      day.map do |key, value|
                        if key == :time || key == :summary || key == :icon || key == :precipProbability || key == :precipType || key == :temperatureHigh || key == :temperatureLow
                          days_hash[key] = value
                        end 
                      end 
                      @daily << days_hash
                    end
  end  
end 