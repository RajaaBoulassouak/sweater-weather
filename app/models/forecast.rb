class Forecast 

  def initialize(data)
    @latitude    =  data[:latitude]
    @longitude   =  data[:longitude]
    @timezone    =  data[:timezone]
    @summary     =  data[:currently][:summary]
    @icon        =  data[:currently][:icon]
    @temperature =  data[:currently][:temperature]
    time         =  data[:currently][:time]
    @time        =  DateTime.strptime(time.to_s,'%s')
    @feel_slike  =  data[:currently][:apparentTemperature]
    @humidity    =  data[:currently][:humidity]
    @visibility  =  data[:currently][:visibility]
    @uv_index    =  data[:currently][:uvIndex]
    @hourly      =  []
                    
                    data[:hourly][:data].map do |hour|
                      hash = {}
                      hour.map do |key, value|
                        if key == :time || key == :icon || key == :temperature
                          hash[key] = value
                        end
                      end
                      hours_hash = hash.map do |key, value|
                        if key == :time
                          DateTime.strptime(value.to_s,'%s')
                        else
                          hash[key] = value
                        end
                      end
                      @hourly << hours_hash
                    end
                    
    @daily       =  []
                  
                    data[:daily][:data].map do |day|
                      hash = {}
                      day.map do |key, value|
                        if key == :time || key == :summary || key == :icon || key == :precipProbability || key == :precipType || key == :temperatureHigh || key == :temperatureLow
                          hash[key] = value
                        end 
                      end 
                      days_hash = hash.map do |key, value|
                        if key == :time
                          DateTime.strptime(value.to_s,'%s')
                        else
                          hash[key] = value
                        end
                      end
                      @daily << days_hash
                    end
  end  
end 