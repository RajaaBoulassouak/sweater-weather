require 'rails_helper'

describe 'Ghiphy API' do
  it 'sends gifs' do
    location = 'denver,co'
    get "/api/v1/gifs?location=#{location}"
    require "pry"; binding.pry
    expect(response).to be_successful
    giphy_data = JSON.parse(response.body)
    expect(giphy_data).to be_a(Array)
  end
end

