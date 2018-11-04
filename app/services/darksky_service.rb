class DarkskyService
# 
#   def get_forecast(coordinates)
#     get_json("/forecast/#{ENV['darksky_api_key']}/#{coordinates[:lat]},#{coordinates[:lng]}")
#   end
# 
#   private 
# 
#   def conn 
#     Faraday.new(:url => "https://api.darksky.net") do |faraday|
#       faraday.adapter Faraday.default_adapter
#     end
#   end 
# 
#   def get_json(url)
#     JSON.parse(conn.get(url).body, symbolize_names: true)
#   end
end