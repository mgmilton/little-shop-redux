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
