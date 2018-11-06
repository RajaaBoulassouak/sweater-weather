class GeocodeService 
  
  def get_coordinates(location)
    get_json("/maps/api/geocode/json?address=#{location}&key=#{ENV['google_api_key']}")
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