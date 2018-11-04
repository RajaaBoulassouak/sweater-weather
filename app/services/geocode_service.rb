class GeocodeService 
  
  location = 'denver,co'
  
  def get_coordinates(location)
    # require "pry"; binding.pry
   conn = Faraday.new(:url => "https://maps.googleapis.com") do |faraday|
     faraday.headers["X-API-KEY"] = ENV["google_api_key"]
     faraday.adapter Faraday.default_adapter
   end
  
  end 
end 