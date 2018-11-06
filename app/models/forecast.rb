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
                      hour_hash = {}
                      hour.map do |key, value|
                        if key == :icon || key == :temperature
                          hour_hash[key] = value
                        elsif
                          key == :time
                            hour_hash[key] = DateTime.strptime(value.to_s,'%s')
                        end
                      end
                      @hourly << hour_hash
                    end
                    
    @daily       =  []
                  
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
                      @daily << day_hash
                    end
  end 
end 