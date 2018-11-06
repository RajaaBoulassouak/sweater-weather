require 'rails_helper'

describe 'Ghiphy API' do
  it 'sends gifs' do
    location = 'denver,co'
    get "/api/v1/gifs?location=#{location}"

    expect(response).to be_successful
    forecast_data = JSON.parse(response.body)
    expect(forecast_data).to have_key('data')
    expect(forecast_data).to have_key('images')
  end
end

