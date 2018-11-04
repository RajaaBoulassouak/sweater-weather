require 'rails_helper'

describe GeocodeService do 
  it 'exists' do
    service = GeocodeService.new 

    expect(service).to be_a(GeocodeService)
  end

  it 'gets lat and long coordinates' do 
    service = GeocodeService.new 

    location_coordinates = service.get_coordinates("denver,co")

    expect(location_coordinates.latitude).to eq('39.7392358')
    expect(location_coordinates.longitude).to eq('-104.990251')
  end 
end