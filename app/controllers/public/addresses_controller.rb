class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!, only: [:index]

  def new
    @address = Address.new
  end

  def index
    @address = Address.new
    @addresses = current_customer.addresses.page(params[:page])
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to public_addresses_path
  end

  def update
   @address = Address.find(params[:id])
   @address.update(address_params)
   redirect_to public_addresses_path(@aderess)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :telephone_number, :address, :customer_id)
  end

end
