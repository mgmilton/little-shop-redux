describe LittleShopApp do
  include Rack::Test::Methods
  def app
    LittleShopApp.new
  end
  it "at the root level'" do
    get '/'
      # binding.pry
    expect(last_response.body).to match("<h1>Welcome to the Man Down by the River")  
  end
end
