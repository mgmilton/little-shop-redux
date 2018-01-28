class Merchant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :items

  def items_count
    self.items.count
  end

  def item_total_sum
    self.items.sum(:price)
  end

  def self.most_items
    select("merchants.id, count(items.id) AS items_count").
    joins(:items).
    group("merchants.id").
    order("items_count DESC")
  end
end

=begin
class Song
  has_many :listens
  scope :top5,
    select("songs.id, OTHER_ATTRS_YOU_NEED, count(listens.id) AS listens_count").
    joins(:listens).
    group("songs.id").
    order("listens_count DESC").
    limit(5)
=end
