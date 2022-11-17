class Order < ApplicationRecord

  belongs_to :customer
  belongs_to :general_customer
  has_many :order_details, dependent: :destroy
end
