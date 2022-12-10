class GeneralPublic::CustomersController < ApplicationController
  def show
    @general_customer = current_general_customer
  end

  def index
    @general_customer = current_general_customer
  end

  def edit
    @general_customer = current_general_customer
  end

  def update
    @general_customer = general_current_customer
    @general_customer.update(general_customer_params)
    redirect_to public_general_customer_path
  end

  def unsubscribe
    @general_customer = current_general_customer
  end

  def withdraw
    @general_customer = current_general_customer
    @general_customer.update(is_deleted: true)
    reset_session
    redirect_to public_path
  end



  private
  def general_customer_params
    params.require(:general_customer).permit(:last_name, :first_name, :corporation, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
