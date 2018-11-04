require 'rails_helper'

describe Forecast do
  it 'exists' do
    geocode_result = Forecast.new

    expect(geocode_result).to be_a(Forecast)
  end

end