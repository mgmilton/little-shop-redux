require 'pry'
require 'csv'
require_relative '../app/models/merchant.rb'
require_relative '../app/models/category.rb'
require_relative '../app/models/item.rb'

Category.destroy_all
Merchant.destroy_all
Item.destroy_all # this starts us fresh every time we run a seed.


categories = CSV.open("data/categories.csv", headers: true, header_converters: :symbol)

categories.each do |row|
  Category.create(
                  id:         row[:id],
                  name:       row[:name],
                  created_at: row[:created_at],
                  updated_at: row[:updated_at]
                )
  end

merchants = CSV.open("data/merchants.csv", headers: true, header_converters: :symbol)

category_id_cycle = Category.pluck(:id).cycle # since we have 0 remainder w/ Total Merchants / Total Categories, when we create the tables now , it just cycles through all Categories every time merchants are now created on our tables

merchants.each do |row|
  Merchant.create(
                  id:         row[:id],
                  name:       row[:name],
                  created_at: row[:created_at],
                  updated_at: row[:updated_at],
                )
end

items = CSV.open("data/items.csv", headers: true, header_converters: :symbol)

items.each do |row|

  Item.create(
              id:         row[:id],
              name:        row[:name],
              description: row[:description],
              price:       row[:unit_price],
              merchant_id: row[:merchant_id],
              category_id: category_id_cycle.next,
              image:       '/images/default_item_img.jpg',
              created_at:  row[:created_at],
              updated_at:  row[:updated_at]
            )
end
