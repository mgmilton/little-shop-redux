class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :"merchants/index"
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  post '/merchants/' do
    Merchant.create()
    erb :"merchants/index"

    redirect '/merchants/index'
  end

  put 'merchant/update' do
    Merchant.update(id.to_i, params[:manager])
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)

    redirect '/merchants/index'
  end
end
