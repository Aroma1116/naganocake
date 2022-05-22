class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :item_amount
      t.integer :postage
      t.integer :order_status, default: 0
      t.integer :method, default: 0
      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :shipping_name
      t.timestamps
    end
  end
end
