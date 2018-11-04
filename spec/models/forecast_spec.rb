require 'rails_helper'

describe Forecast do
  it 'exists' do
    data = {  currently: "some data",
              hourly: {data: "hourly data"},
              daily: {data: "daily data"}
           }
    geocode_result = Forecast.new(data)

    expect(geocode_result).to be_a(Forecast)
  end
end