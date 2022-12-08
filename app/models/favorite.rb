class Favorite < ApplicationRecord

  

  belongs_to :customer
  belongs_to :general_customer
  belongs_to :item

end
