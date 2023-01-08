class Order < ApplicationRecord

  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true
  has_many :order_details, dependent: :destroy


  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1 }

  def self.search(search)
    if Rails.env.production?
    else
    #customer_ids = Customer.where('first_name LIKE ? OR last_name LIKE ?', "%太郎%", "%太郎%").pluck(:id)
    #general_customer_ids = GeneralCustomer.where('first_name LIKE ? OR last_name LIKE ?', "%太郎%", "%太郎%").pluck(:id)
    search ? left_joins(:customer).left_joins(:general_customer).select('orders.id, customers.corporation, orders.customer_id, orders.general_customer_id, orders.postal_code, orders.spot, orders.address, orders.created_at, customers.last_name, customers.first_name, (customers.last_name || customers.first_name) AS c_full_name, general_customers.first_name, general_customers.last_name, (general_customers.last_name || general_customers.first_name) AS g_full_name').
             where('orders.spot LIKE ? OR orders.address LIKE ? OR customers.corporation LIKE ? OR c_full_name LIKE ? OR g_full_name LIKE ?' ,"%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%") : all
    end
  end

  def full_name
    self.last_name + " " + self.first_name
  end


end
