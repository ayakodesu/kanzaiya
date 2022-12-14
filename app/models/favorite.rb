class Favorite < ApplicationRecord

  has_one_attached :image

  has_one :customer
  has_one :general_customer
  belongs_to :item

  #validates_uniqueness_of :item_id, scope: customer_id
  #validates_uniqueness_of :item_id, scope: general_customer_id





end

