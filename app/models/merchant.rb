class Merchant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :items

  def item_total_sum
    self.items.sum(:price)
  end

  def self.most_items
    max = maximum(:item_count)
    find_by_item_count(max)
  end
end
