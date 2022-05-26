class OrderDetails < ActiveRecord::Migration[6.1]
  def change
    drop_table :order_details
  end
end
