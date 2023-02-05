class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def index
    @customer = current_customer
    @customers = Customer.all
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "変更を保存しました"
      redirect_to public_customer_path
    else
    render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to public_path
  end

private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :telephone_number, :corporation, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
