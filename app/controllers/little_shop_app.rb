require_relative "../models/merchant.rb"
require_relative "../models/category.rb"
require_relative "../models/item.rb"

class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  not_found do
    status 404
    erb :error
  end

  get '/' do
    erb :dashboard
  end

  get '/merchants' do
    @merchants = Merchant.order(:name)
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

  get '/merchants-dashboard' do
    @merchants = Merchant.all
    @high_item_merchant = Merchant.most_item_merchants
    # require "pry"; binding.pry
    @golden_merchant = Item.highest_item.merchant
    @item = Item.highest_item
    erb :"/merchants/dashboard"
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
    erb :"categories/show"
  end

  get '/categories/:id/edit' do
    @category = Category.find(params[:id])
    erb :"categories/edit"
  end

  get '/categories-dashboard' do
    @categories = Category.all
    @itemscategory1 = Item.where(category_id: 1)
    @itemscategory2 = Item.where(category_id: 2)
    @itemscategory3 = Item.where(category_id: 3)
    @itemscategory4 = Item.where(category_id: 4)
    @itemscategory5 = Item.where(category_id: 5)
    @most_expensive_id = Item.all.order(:price).last.category_id
    @least_expensive_id = Item.all.order(:price).first.category_id
    erb :"/categories/dashboard"
  end

  post '/categories' do
    Category.create(params[:category])
    redirect '/categories'
  end

  put '/categories/:id' do
    category = Category.find(params[:id])
    category.update(params[:category])
    redirect "/categories/#{category.id}"
  end

  delete '/categories/:id' do
    category = Category.find(params[:id])
    category.destroy
    redirect '/categories'
  end

  get '/items' do
    @items = Item.order(:name)
    erb :"items/index"
  end

  get '/items/new' do
    @merchants = Merchant.all
    @categories = Category.all
    erb :"items/new"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :"items/show"
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :"items/edit"
  end

  get '/items-dashboard' do
    @item = Item.all
    @most_recent = Item.order(:created_at).last
    @oldest = Item.order(:created_at).first
    erb :"/items/dashboard"
  end

  post '/items' do
    Item.create(params[:item])
    redirect '/items'
  end

  put '/items/:id' do
    item = Item.find(params[:id])
    item.update(params[:item])
    redirect "/items/#{item.id}"
  end

  delete '/items/:id' do
    item = Item.find(params[:id])
    item.destroy
    redirect '/items'
  end
end
