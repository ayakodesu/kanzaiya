class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
    @customers = Customer.page(params[:page])
    @general_customer = GeneralCustomer.all
    @general_customers = GeneralCustomer.page(params[:id])
    @instances = customers | general_customer

  end

  def show
    @customer = Customer.find(params[:id])
    @general_customer = GeneralCustomer.find(params[:id])
  end

  def edit
  end
end
