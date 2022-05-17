class RemoveIdFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :customer_id, :integer
  end
end
