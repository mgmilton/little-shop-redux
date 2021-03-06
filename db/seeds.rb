require 'pry'
require 'csv'
require_relative '../app/models/merchant.rb'
require_relative '../app/models/category.rb'
require_relative '../app/models/item.rb'

Category.destroy_all
Merchant.destroy_all
Item.destroy_all

merchants = CSV.open("data/merchants.csv", headers: true, header_converters: :symbol)
categories = CSV.open("data/categories.csv", headers: true, header_converters: :symbol)
items = CSV.open("data/items.csv", headers: true, header_converters: :symbol)

categories.each do |row|
  Category.create(id:         row[:id],
                  name:       row[:name],
                  created_at: row[:created_at],
                  updated_at: row[:updated_at])
end

merchants.each do |row|
  Merchant.create(id:         row[:id],
                  name:       row[:name],
                  created_at: row[:created_at],
                  updated_at: row[:updated_at])
end


category_id_cycle = Category.pluck(:id).cycle


items.each do |row|
  Item.create(id:          row[:id],
              name:        row[:name],
              description: row[:description],
              price:       row[:unit_price],
              merchant_id: row[:merchant_id],
              category_id: category_id_cycle.next ,
              image:       "http://ask-angels.swellpress.netdna-cdn.com/wp-content/uploads/2014/10/healing-crystals-1024x292.jpg",
              created_at:  row[:created_at],
              updated_at:  row[:updated_at])
end
