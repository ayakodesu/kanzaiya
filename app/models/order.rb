class Order < ApplicationRecord

  has_one :customer
  has_one :general_customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, bank_transfer: 1 }



end
