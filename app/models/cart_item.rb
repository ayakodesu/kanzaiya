class CartItem < ApplicationRecord

  has_one_attached :image

  def subtotal
    item.last_price * amount
  end

  has_one :customer
  has_one :general_customer
  belongs_to :item
end
