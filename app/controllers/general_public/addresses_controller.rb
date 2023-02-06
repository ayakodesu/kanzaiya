class GeneralPublic::AddressesController < ApplicationController
  before_action :authenticate_general_customer!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @address = Address.new
  end

  def index
    @address = Address.new
    @addresses = current_general_customer.addresses.page(params[:page])
  end

  def edit

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
    if @address.update(address_params)
      flash[:success] = "変更を保存しました"
      redirect_to general_public_addresses_path(@aderess)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy if @address
    redirect_to general_public_addresses_path
  end

  private
  
  def correct_user
    @address = current_general_customer.addresses.find_by(id: params[:id])
    redirect_to  root_path unless @address
  end

  def address_params
   params.require(:address).permit(:name, :postal_code, :telephone_number, :address, :general_customer_id)
  end
end
