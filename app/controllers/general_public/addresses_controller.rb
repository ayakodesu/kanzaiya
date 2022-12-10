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

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to general_pablic_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to general_public_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to general_pablic_addresses_path
  end

  private

  def address_params
   params.require(:address).permit(:name, :postal_code, :telephone_number, :address, :general_customer_id)
  end

end
