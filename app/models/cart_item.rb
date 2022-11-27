class CartItem < ApplicationRecord

  has_one_attached :image

  def subtotal
    item.last_price * amount
  end

  belongs_to :customer
  #belongs_to :general_customer
  belongs_to :item
end
