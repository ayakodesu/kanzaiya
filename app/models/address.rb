class Address < ApplicationRecord

  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :telephone_number, presence: true
  validates :address, presence: true

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end



end
