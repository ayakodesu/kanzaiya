class Favorite < ApplicationRecord

  has_one_attached :image

  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true
  belongs_to :item

end

