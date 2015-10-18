class AddGroceryIdToGroceryItems < ActiveRecord::Migration
  def change
  	add_column :grocery_items, :grocery_id, :integer
  end
end
