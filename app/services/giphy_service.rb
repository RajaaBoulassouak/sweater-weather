class GiphyService

  def get_gifs(summary)
    get_json("/v1/gifs/search?api_key=#{ENV['giphy_api_key']}&q=#{summary}&limit=1&offset=0&rating=G&lang=en")
  end

  private 

  def conn 
    Faraday.new(:url => "https://api.giphy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end 

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end