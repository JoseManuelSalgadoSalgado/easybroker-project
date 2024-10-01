require 'minitest/autorun'
require 'easy_broker'

class EasyBrokerTest < Minitest::Test
  def setup
    EasyBroker.configure do |config|
      config.api_key = '6ul5rl4mywn4qkibe24h2luq0e6zq0'
    end
    @client = EasyBroker.client
  end

  def test_fetch_properties
    result = @client.properties.search
    
    assert_instance_of EasyBroker::PaginatedResponse, result
    
    assert_respond_to result, :content
    
    assert_kind_of Integer, result.total
    
    if result.total > 0
      assert_kind_of Array, result.content
    end
  end
end
