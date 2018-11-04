require 'rails_helper'

describe DarkskyService do 
  it 'exists' do
    service = DarkskyService.new 

    expect(service).to be_a(DarkskyService)
  end

#   it 'gets weather forecast data' do 
#     service = DarkskyService.new 
#     coordinates = {:lat=>39.7392358, :lng=>-104.990251}
# 
#     forecast_data = service.get_forecast(coordinates)
# 
#     expect(forecast_data[:timezone]).to eq('America/Denver')
#   end
end