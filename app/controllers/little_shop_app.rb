require_relative "../models/merchant.rb"
require_relative "../models/category.rb"
require_relative "../models/item.rb"

class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  put '/merchants/:id' do
    merchant = Merchant.find(params[:id])
    merchant.update(params[:merchant])
    redirect "/merchants/#{merchant.id}"
  end

  delete '/merchants/:id' do
    merchant = Merchant.find(params[:id])
    merchant.destroy
    redirect '/merchants'
  end

  get '/categories' do
    @categories = Category.all
    erb :"categories/index"
  end

  get '/categories/new' do
    erb :"categories/new"
  end

  get '/categories/:id' do
    @category = Category.find(params[:id])
    erb :"category/show"
  end

  get '/categoies/:id/edit' do
    @category = Category.find(params[:id])
    erb :"category/edit"
  end

  post '/category' do
    Category.create(params[:category])
    redirect '/category'
  end

  put '/category/:id' do
    category = Category.find(params[:id])
    category.update(name: params[:category].values.first)
    redirect "/category/#{category.id}"
  end

  delete '/category/:id' do
    category = Category.find(params[:id])
    category.destroy
    redirect '/category'
  end

  get '/items' do
    @items = Item.all
    erb :"items/index"
  end

  get '/items/new' do
    erb :"items/new"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :"item/show"
  end

  get '/item/:id/edit' do
    @item = Item.find(params[:id])
    erb :"item/edit"
  end

  post '/item' do
    Item.create(params[:item])
    redirect '/item'
  end

  put '/category/:id' do
    item = Item.find(params[:id])
    item.update(name: params[:item].values.first)
    redirect "/item/#{item.id}"
  end

  delete '/items/:id' do
    item = Item.find(params[:id])
    item.destroy
    redirect '/item'
  end
end
