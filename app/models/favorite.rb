class Favorite < ApplicationRecord

  has_one_attached :image

  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true
  belongs_to :item

end

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
