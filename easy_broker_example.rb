require 'easy_broker'

EasyBroker.configure do |config|
  config.api_key = '6ul5rl4mywn4qkibe24h2luq0e6zq0'
end

client = EasyBroker.client

def fetch_properties(client)
  begin
    results = client.properties.search

    puts "Total properties found: #{results.total}" 

    if results.total.zero?
      puts "No se encontraron propiedades."
    else
      results.content.each do |property| 
        puts "Property Title: #{property.title}"
      end
    end
  rescue => e
    puts "Error fetching properties: #{e.message}"
  end
end

fetch_properties(client)
