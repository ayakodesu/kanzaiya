class CartItem < ApplicationRecord

  has_one_attached :image

  def subtotal
    item.with_tax_price * amount
  end

  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true
  belongs_to :item

  def cart_item_amount_cannot_be_greater_than_item_amount
    if amount > item.amount
      errors.add(:amount, "※在庫合計数よりを注文数が多いです。")
    end
  end

end
