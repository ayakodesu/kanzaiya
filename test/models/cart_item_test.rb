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
require "test_helper"

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
