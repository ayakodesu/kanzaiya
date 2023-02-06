# == Schema Information
#
# Table name: addresses
#
#  id                  :integer          not null, primary key
#  address             :string           not null
#  name                :string           not null
#  postal_code         :string           not null
#  spot                :string
#  telephone_number    :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  customer_id         :integer
#  general_customer_id :integer
#
require "test_helper"

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
