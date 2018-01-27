class AddCategoryIdToMerchants < ActiveRecord::Migration[5.1]
  def change
    add_column :merchants, :category_id, :integer
  end
end
