require_relative "../models/merchant.rb"

class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/merchants' do
    @merchants = Merchant.all
    require "pry"; binding.pry
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
  
  get '/merchants/new' do
    erb :"merchants/new"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find_by(id: params[:id])
    erb :"merchants/show"
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find_by(id: params[:id])
    erb :"merchants/edit"
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  put '/merchants/:id' do
    merchant = Merchant.find_by(id: params[:id])
    merchant.update(name: params[:merchant].values.first)
    redirect "/merchants/#{merchant.id}"
  end

  delete '/merchants/:id' do
    merchant = Merchant.find_by(id: params[:id])
    merchant.destroy
    redirect '/merchants'
  end

end
