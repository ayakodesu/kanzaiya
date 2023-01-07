class Order < ApplicationRecord

  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true
  has_many :order_details, dependent: :destroy


  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1 }

def self.search(search)
  search ? where('spot LIKE ? OR address LIKE ? OR name LIKE?', "%#{search}%","%#{search}%","%#{search}%") : all
end

def full_name
  self.last_name + " " + self.first_name
end


end
