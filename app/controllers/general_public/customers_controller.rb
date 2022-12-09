class GeneralPublic::CustomersController < ApplicationController
  def show
  end

  def index
    @general_customer = current_general_customer
  end

  def edit
  end


  private
  def general_customer_params
    params.require(:general_customer).permit(:last_name, :first_name, :corporation, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
