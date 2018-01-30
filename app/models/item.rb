class Item < ActiveRecord::Base
  validates :name, :description, presence: true, uniqueness: true

  validates_presence_of :price, :image

  belongs_to :merchant
  belongs_to :categories

  def self.average_price_per_item
    (average(:price)/100).round(2)
  end

  def self.highest_item
    order(price: :desc).first
  end

  def self.slice_by_name(letter)
    where("name like ?", "#{letter}%")
  end
end
