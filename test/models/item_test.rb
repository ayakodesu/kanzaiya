# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  amount       :integer          not null
#  introduction :text
#  is_active    :boolean          default(TRUE), not null
#  last_price   :integer          not null
#  name         :string           not null
#  shape        :string
#  size         :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  genre_id     :integer          not null
#
require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
