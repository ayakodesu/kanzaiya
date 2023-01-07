class CartItem < ApplicationRecord

  has_one_attached :image

  def subtotal
    item.with_tax_price * amount
  end

  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true
  belongs_to :item

end
