class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order
  validate :order_item_amount_cannot_be_greater_than_item_amount


  def order_item_amount_cannot_be_greater_than_item_amount
    if amount > item.amount
      errors.add(:amount, "在庫合計数よりを注文数が多いです。")
    end
  end
end
