class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum production_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}

  def subtotal_order
    item.with_tax_price * quantity
  end
end
