class Item < ActiveRecord::Base
  validates :name, :description, :price, :image, presence: true
  validates :name, uniqueness: true

  belongs_to :merchant
  belongs_to :category
end
