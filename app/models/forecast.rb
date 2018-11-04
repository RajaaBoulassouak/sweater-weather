class Forecast 

  def initialize(data)
    @currently = data[:currently]
    @hourly = data[:hourly][:data]
    @daily = data[:daily][:data]
  end
end 