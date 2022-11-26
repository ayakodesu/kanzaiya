class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
    @general_customer = GeneralCustomer.all
    @instances = @customer | @general_customer



  end

  def show

    @customer = Customer.find(params[:id])
    @general_customer = GeneralCustomer.find(params[:id])
    @instances = @customer
    @instances = @general_customer

  end

  def edit
  end

  private
  def customer_params
    params.require(:customer).permit(:customer_id, :telephone_number, :email, :postal_code, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :corporation, :is_deleted)

  def general_customer_params
    params.require(:general_customer).permit(:general_customer_id, :telephone_number, :email, :postal_code, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :is_deleted)

  end
  end






end
