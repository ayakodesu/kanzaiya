class Address < ApplicationRecord

  belongs_to :customer
  belongs_to :general_customer
end
