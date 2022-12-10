class GeneralPublic::AddressesController < ApplicationController

  def new
    @address = Address.new
  end


  def index
    @address = Address.new
    @addresses = current_general_customer.addresses.page(params[:page])
  end

  def edit
    @address = Address.find(params[:id])
  end


  private

  def address_params
   params.require(:address).permit(:name, :postal_code, :telephone_number, :address, :general_customer_id)
  end

end
