class Order < ApplicationRecord

  enum method: { クレジットカード: 0, 銀行振込: 1 }
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 配送準備中: 3, 配送済み: 4 }
  belongs_to :customer
  has_many :order_details

  def shipping_address_display
    '〒' + shipping_postal_code + ' ' + shipping_address + ' ' + shipping_name
  end

 def order_statuses
   Order.order_statuses
 end

end
