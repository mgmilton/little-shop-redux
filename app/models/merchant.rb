class Merchant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :items

  def item_total_sum
    self.items.sum(:price)
  end

  def self.most_items
    joins(:items).
    select('merchants.*, COUNT(items.*) AS items_count')
    .group('merchants.id')
    .order('items_count DESC').first(2)
  end

  def total_items
    items.count
  end

end
