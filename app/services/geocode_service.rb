class GeocodeService 
  
  location = 'denver,co'
  
  def get_coordinates(location)
    data = get_json("/maps/api/geocode/json?address=#{location},co&key=#{ENV['google_api_key']}")
    data[:results].first[:geometry][:location]
  end
  
  def lat_and_long
    lat = coordinates[:lat]
    long = coordinates[:lng]
  end
  
  private
  
  def conn 
    Faraday.new(:url => "https://maps.googleapis.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end 

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end 