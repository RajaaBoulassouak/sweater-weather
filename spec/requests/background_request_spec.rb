require 'rails_helper'

describe 'Backgrounds API' do
  it 'sends background pics based on selected location' do
    location = 'denver,co'
    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful
    background_data = JSON.parse(response.body)
    expect(background_data).to be_a(Array)
  end
end