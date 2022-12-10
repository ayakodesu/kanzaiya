class Order < ApplicationRecord

  belongs_to :customer
  #belongs_to :general_customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, bank_transfer: 1 }



end
