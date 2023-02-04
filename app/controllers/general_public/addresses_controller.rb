class GeneralPublic::AddressesController < ApplicationController
  before_action :authenticate_general_customer!

  def new
    @address = Address.new
  end

  def index
    @address = Address.new
    @addresses = current_general_customer.addresses.page(params[:page])
  end

  def edit
    @address = Address.find(params[:id])
    unless @address.general_customer == current_general_customer
      redirect_to  edit_general_public_address_path
    end
  end

  def create
    @address = Address.new(address_params)
      if @address.save
        redirect_to general_public_addresses_path
      else
        @addresses = current_general_customer.addresses.page(params[:page])
        render :index
      end
  end

  def update
   @address = Address.find(params[:id])
    if @address.update(address_params)
     flash[:success] = "変更を保存しました"
   redirect_to general_public_addresses_path(@aderess)
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to general_public_addresses_path
  end

  private

  def address_params
   params.require(:address).permit(:name, :postal_code, :telephone_number, :address, :general_customer_id)
  end
end
