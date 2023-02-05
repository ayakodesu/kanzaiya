class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def new
    @address = Address.new
  end

  def index
    @address = Address.new
    @addresses = current_customer.addresses.page(params[:page])
  end

  def edit
    @address = Address.find(params[:id])
    unless @address.customer == current_customer
      redirect_to  edit_public_address_path
    end
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to public_addresses_path
    else
      @addresses = current_customer.addresses.page(params[:page])
      render :index
    end
  end

  def update
   @address = Address.find(params[:id])
    if @address.update(address_params)
     flash[:success] = "変更を保存しました"
      redirect_to public_addresses_path(@aderess)
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :spot, :telephone_number, :address, :customer_id)
  end
end
