class RemoveItemIdFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :item_id, :integer
  end
end
