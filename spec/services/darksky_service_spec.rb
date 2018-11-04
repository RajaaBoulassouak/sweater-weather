require 'rails_helper'

describe DarkskyService do 
  it 'exists' do
    service = DarkskyService.new 

    expect(service).to be_a(DarkskyService)
  end
end