class Item < ActiveRecord::Base
  validates :name, :description, :price, :image, presence: true, uniqueness: true

  belongs_to :merchant
  # belongs_to :categories
end
