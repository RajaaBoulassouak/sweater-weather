require 'rails_helper'

describe 'Forecast API' do
  it 'sends weather details' do
    location = 'denver,co'
    get "api/v1/forecast?location=#{location}"

    expect(response).to be_successful
  end
end

