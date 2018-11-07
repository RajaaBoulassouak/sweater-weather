class FlickrService 
  
  def get_backgrounds(coordinates)
    get_json("/services/rest/?api_key=#{ENV['flickr_api_key']}&method=flickr.photos.search&lat=#{coordinates[:lat]}&lon=#{coordinates[:lng]}&radius=5&nojsoncallback=1&format=json&extras=url_o")
    # require "pry"; binding.pry
  end
  
  private
  
  def conn 
    Faraday.new(:url => "https://api.flickr.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end 

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end 