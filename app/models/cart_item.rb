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
      errors.add(:amount, "※在庫合計数よりを注文数が上回っています。")
    end
  end

end

# == Schema Information
#
# Table name: cart_items
#
#  id                  :integer          not null, primary key
#  amount              :integer          not null
#  shape               :string
#  size                :integer
#  spot                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  customer_id         :integer
#  general_customer_id :integer
#  item_id             :integer          not null
#
