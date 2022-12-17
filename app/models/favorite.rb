class Favorite < ApplicationRecord

  has_one_attached :image

  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true
  belongs_to :item

  #validates_uniqueness_of :item_id, scope: customer_id
  #validates_uniqueness_of :item_id, scope: general_customer_id





end

