class RemoveItemsCountFromMerchant < ActiveRecord::Migration[5.1]
  def change
    remove_column :merchants, :items_count
  end
end
