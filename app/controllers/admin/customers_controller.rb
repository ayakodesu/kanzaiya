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
end
