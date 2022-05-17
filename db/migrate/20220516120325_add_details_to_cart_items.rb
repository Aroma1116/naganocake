class AddDetailsToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :cart_items, :customer, foreign_key: true
    add_reference :cart_items, :item, foreign_key: true
  end
end
