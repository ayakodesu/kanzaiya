class Admin::GeneralCustomersController < ApplicationController
  def edit
     @general_customer = GeneralCustomer.find(params[:id])
  end

  def update
    @general_customer = GeneralCustomer.find(params[:id])
    @general_customer.update(general_customer_params)
     flash[:success] = "変更を保存しました"
    redirect_to admin_general_customer_path(@general_customer)
  end

  def index
    @general_customers = GeneralCustomer.all
  end

  def show
    @general_customer = GeneralCustomer.find(params[:id])
  end

  def general_customer_params
    params.require(:general_customer).permit(:general_customer_id, :telephone_number, :email, :postal_code, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :is_deleted)

  end
end
