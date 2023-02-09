class Order < ApplicationRecord

  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true
  has_many :order_details, dependent: :destroy

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

  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1 }

  def full_name
    self.last_name + " " + self.first_name
  end

  def self.searchs(search)
    #if Rails.env.production?
    #else
    #customer_ids = Customer.where('first_name LIKE ? OR last_name LIKE ?', "%太郎%", "%太郎%").pluck(:id)
    #general_customer_ids = GeneralCustomer.where('first_name LIKE ? OR last_name LIKE ?', "%太郎%", "%太郎%").pluck(:id)
    left_joins(:customer).left_joins(:general_customer).select('orders.id, customers.corporation, orders.name, orders.telephone_number, orders.customer_id, orders.general_customer_id, orders.postal_code, orders.spot, orders.address, orders.created_at, customers.last_name, customers.first_name, (customers.last_name || customers.first_name) AS c_full_name, general_customers.first_name, general_customers.last_name, (general_customers.last_name || general_customers.first_name) AS g_full_name').
             where('orders.spot LIKE ? OR orders.name LIKE ? OR orders.address LIKE ? OR customers.corporation LIKE ? ' ,"%#{search}%","%#{search}%","%#{search}%","%#{search}%")
  end

  def self.search(search)
    #if Rails.env.production?
    #else
    #customer_ids = Customer.where('first_name LIKE ? OR last_name LIKE ?', "%太郎%", "%太郎%").pluck(:id)
    #general_customer_ids = GeneralCustomer.where('first_name LIKE ? OR last_name LIKE ?', "%太郎%", "%太郎%").pluck(:id)
    left_joins(:customer).left_joins(:general_customer).select('orders.id, customers.corporation, orders.name, orders.telephone_number, orders.customer_id, orders.general_customer_id, orders.postal_code, orders.spot, orders.address, orders.created_at, customers.last_name, customers.first_name, (customers.last_name || customers.first_name) AS c_full_name, general_customers.first_name, general_customers.last_name, (general_customers.last_name || general_customers.first_name) AS g_full_name').
             where('orders.spot LIKE ? OR orders.name LIKE ? OR orders.address LIKE ? ' ,"%#{search}%","%#{search}%","%#{search}%")
  end

end

# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  address             :string           not null
#  name                :string           not null
#  payment_method      :integer          default("credit_card"), not null
#  postal_code         :string           not null
#  shipping_cost       :integer          not null
#  spot                :string
#  status              :integer          default("waiting_for_payment"), not null
#  telephone_number    :string           not null
#  total_payment       :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  customer_id         :integer
#  general_customer_id :integer
#
