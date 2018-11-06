class Forecast 

  def initialize(data)
    @daily       =  daily_forecast(data)         
    @timezone    =  data[:timezone]
  end 
end 