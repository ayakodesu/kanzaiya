class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order
  validate :order_item_amount_cannot_be_greater_than_item_amount


  def order_item_amount_cannot_be_greater_than_item_amount
    if amount > item.amount
      errors.add(:amount, "※在庫合計数よりを注文数が多いです。")
    end
  end
end

# == Schema Information
#
# Table name: order_details
#
#  id         :integer          not null, primary key
#  amount     :integer          not null
#  price      :integer          not null
#  shape      :string
#  size       :integer
#  spot       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer          not null
#  order_id   :integer          not null
#
