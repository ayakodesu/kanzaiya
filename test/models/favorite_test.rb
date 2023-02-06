# == Schema Information
#
# Table name: favorites
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  customer_id         :integer
#  general_customer_id :integer
#  item_id             :integer
#
require "test_helper"

class FavoriteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
