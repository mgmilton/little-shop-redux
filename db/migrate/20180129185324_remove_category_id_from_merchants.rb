class RemoveCategoryIdFromMerchants < ActiveRecord::Migration[5.1]
  def change
    remove_column :merchants, :category_id, :integer
  end
end
