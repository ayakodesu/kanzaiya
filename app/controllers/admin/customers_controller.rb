class Admin::CustomersController < ApplicationController

  def index
    if params[:search].present?
      @customers = Customer.search(params[:search]).page(params[:page]).per(10)
    else
      @customers = Customer.all.page(params[:page]).per(10)
    end
    #@customers = Customer.all
    #@instances = @customer | @general_customer
    #@customers = Customer.search(params[:search])
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
     flash[:success] = "変更を保存しました"
    redirect_to admin_customer_path(@customer)
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_id, :telephone_number, :email, :postal_code, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :corporation, :is_deleted)
  end
end
