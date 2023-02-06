class Address < ApplicationRecord

  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true
  
  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  VALID_TELEPHONE_NUMBER_REGEX = /\A\d{10,11}\z/

  validates :name, presence: true, length: { maximum: 10 }
  validates :postal_code, presence: true, format: { 
                                            with: VALID_POSTAL_CODE_REGEX,
                                            message: "は半角英数７桁で入力して下さい。" }
  validates :telephone_number, presence: true, format: { 
                                            with: VALID_TELEPHONE_NUMBER_REGEX,
                                            message: "は半角英数10~11桁で入力して下さい。" }
  validates :address, presence: true, length: { maximum: 100 }

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end



end

# == Schema Information
#
# Table name: addresses
#
#  id                  :integer          not null, primary key
#  address             :string           not null
#  name                :string           not null
#  postal_code         :string           not null
#  spot                :string
#  telephone_number    :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  customer_id         :integer
#  general_customer_id :integer
#
