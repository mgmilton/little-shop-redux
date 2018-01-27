describe LittleShopApp do
  include Rack::Test::Methods
  def app # this just exists so we can use 'get' and test rack methods like 'get', 'post', etc
    LittleShopApp.new
  end
  it "at the root level'" do
    get '/'

    expect(last_response.body).to match("<h1>Welcome to the Man Down by the River") # this is testing the raw HTML output which lets us know its sending right signals
  end

  it "can successfully create merchant" do
    post '/merchants', merchant: {name: 'BOBS BURGERS'} # need to pass params after the method call in hash format after a comma

    expect(Merchant.count).to eq(1)
    expect(Merchant.first.name).to eq("BOBS BURGERS")
  end
end
