describe LittleShopApp do
  include Rack::Test::Methods
  def app
    LittleShopApp.new
  end
end
