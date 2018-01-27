class Item < ActiveRecord::Base
  validates :name, :description, :price, :image, presence: true, uniqueness: true
end
