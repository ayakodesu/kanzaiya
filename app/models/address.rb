class Address < ApplicationRecord

  belongs_to :customer
  #belongs_to :general_customer

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
