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
require "test_helper"

class OrderDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
