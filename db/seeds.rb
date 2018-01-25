require 'pry'
require 'csv'
require_relative '../app/models/merchant.rb'
require_relative '../app/models/category.rb'

merchants = CSV.open("data/merchants.csv", headers: true, header_converters: :symbol)

merchants.each do |row|
  Merchant.create(id:         row[:id],
                  name:       row[:name],
                  created_at: row[:created_at],
                  updated_at: row[:updated_at])
end

categories = CSV.open("data/categories.csv", headers: true, header_converters: :symbol)

categories.each do |row|
  Category.create(id:         row[:id],
                  name:       row[:name],
                  created_at: row[:created_at],
                  updated_at: row[:updated_at])
end

# items = CSV.open("data/items.csv", headers: true, header_converters: :symbol)
#
# items.each do |row|
#   Item.create(title:       row[:name],
#               description: row[:description],
#               price:       row[:unit_price],
#               image:       'data/images/default_item_img.jpg',
#               created_at:  row[:created_at],
#               updated_at:  row[:updated_at])
# end
