class Merchant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :items

  def item_total_sum
    self.items.sum(:price)
  end

  def self.merchants_grouped_by_highest_item_count
    joins(:items).
    select('merchants.*, COUNT(items.*) AS items_count')
    .group('merchants.id')
    .order('items_count DESC')
  end

  def self.highest_item_count
    merchants_grouped_by_highest_item_count.first.total_items
  end

  def self.most_item_merchants
    top_merchants = []
    merchants_grouped_by_highest_item_count.each do |merchant|
      break if merchant.items.count < highest_item_count
      top_merchants << merchant
    end
    top_merchants
  end

  def total_items
    items.count
  end

end
