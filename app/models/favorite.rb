class Favorite < ApplicationRecord

  has_one_attached :image

  has_one :customer
  has_one :general_customer
  belongs_to :item





end

