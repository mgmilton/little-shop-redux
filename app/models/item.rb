class Item < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  validates :description, presence: true

  validates :price, presence: true
  
  validates :image, presence: true
end
