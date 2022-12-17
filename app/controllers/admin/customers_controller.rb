class Admin::CustomersController < ApplicationController

  def index
    @customer = Customer.all
    @general_customer = GeneralCustomer.all
    @instances = @customer | @general_customer
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_id, :telephone_number, :email, :postal_code, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :corporation, :is_deleted)
  end






end
