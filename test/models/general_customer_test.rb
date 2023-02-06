# == Schema Information
#
# Table name: general_customers
#
#  id                     :integer          not null, primary key
#  address                :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  first_name_kana        :string           not null
#  is_deleted             :boolean          default(FALSE), not null
#  last_name              :string           not null
#  last_name_kana         :string           not null
#  postal_code            :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  telephone_number       :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_general_customers_on_email                 (email) UNIQUE
#  index_general_customers_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class GeneralCustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
