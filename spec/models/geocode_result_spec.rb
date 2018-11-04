require 'rails_helper'

describe GeocodeResult do
  it 'exists' do
    geocode_result = GeocodeResult.new
    
    expect(geocode_result).to be_a(GeocodeResult)
  end
  
end