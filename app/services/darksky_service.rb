class DarkskyService
  
  coordinates = {:lat=>39.7392358, :lng=>-104.990251}
  
  def get_forecast(coordinates)
    conn = Faraday.new(:url => "https://api.darksky.net") do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    
    response = conn.get("/forecast/#{ENV['darksky_api_key']}/#{coordinates[:lat]},#{coordinates[:lng]}")
 
    data = JSON.parse(response.body, symbolize_names: true)
  end
end