# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  address             :string           not null
#  name                :string           not null
#  payment_method      :integer          default("credit_card"), not null
#  postal_code         :string           not null
#  shipping_cost       :integer          not null
#  spot                :string
#  status              :integer          default("waiting_for_payment"), not null
#  telephone_number    :string           not null
#  total_payment       :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  customer_id         :integer
#  general_customer_id :integer
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
