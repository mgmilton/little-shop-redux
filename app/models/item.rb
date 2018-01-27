class Item < ActiveRecord::Base
  validates :name, :description, presence: true, uniqueness: true
  validates_presence_of :price, :image
  belongs_to :merchant
  belongs_to :categories
end
