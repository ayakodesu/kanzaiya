class Address < ApplicationRecord

  has_one :customer
  has_one :general_customer

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
