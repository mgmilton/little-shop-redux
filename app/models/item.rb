class Item < ActiveRecord::Base
  validates_presence_of :name, :description, :price, :image

  belongs_to :merchant
  belongs_to :categories

  def self.average_price_per_item
    (average(:price)/100).round(2)
  end

  def self.highest_item
    order(price: :desc).first
  end
end
