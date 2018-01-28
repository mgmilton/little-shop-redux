class Merchant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :items

  def self.items_count
    items.count
  end
end
