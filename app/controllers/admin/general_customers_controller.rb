class Admin::GeneralCustomersController < ApplicationController
  def edit
     @general_customer = GeneralCustomer.find(params[:id])

  end

  def index
    @customer = Customer.all
    @general_customer = GeneralCustomer.all
    @instances = @customer | @general_customer
  end

  def show
    @general_customer = GeneralCustomer.find(params[:id])
  end

  def general_customer_params
    params.require(:general_customer).permit(:general_customer_id, :telephone_number, :email, :postal_code, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :is_deleted)

  end
end
