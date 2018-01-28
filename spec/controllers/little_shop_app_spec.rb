describe LittleShopApp do
  include Rack::Test::Methods
  def app
    LittleShopApp.new
  end

  it "at the root level'" do
    get '/'

    expect(last_response.body.length).to eq(1443)
  end

  it "can successfully create merchant" do
    post '/merchants', merchant: {name: 'BOBS BURGERS'}

    expect(Merchant.count).to eq(1)
    expect(Merchant.first.name).to eq("BOBS BURGERS")
  end
end
