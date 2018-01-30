class Merchant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :items

  def item_total_sum
    self.items.sum(:price)
  end

  def self.most_items
    left_outer_joins(:items).
    distinct.select('merchants.*, COUNT(items.*) AS items_count')
    .group('merchants.id')
    .order('items_count DESC')
    limit(1)
  end
end
