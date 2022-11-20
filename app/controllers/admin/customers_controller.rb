class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end
end
