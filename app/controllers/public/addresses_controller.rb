class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @address = Address.new
  end

  def index
    @address = Address.new
    @addresses = current_customer.addresses.page(params[:page])
  end

  def edit

  end

  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:success] = "新規登録しました"
      redirect_to public_addresses_path
    else
      @addresses = current_customer.addresses.page(params[:page])
      render :index
    end
  end

  def update
   #@address = Address.find(params[:id])
    if @address.update(address_params)
     flash[:success] = "変更を保存しました"
      redirect_to public_addresses_path(@aderess)
    else
      render :edit
    end
  end

  def destroy
    #@address = Address.find(params[:id])
    @address.destroy if @address
    flash[:success] = "削除しました"
    redirect_to public_addresses_path
  end

  private

  def correct_user
    @address = current_customer.addresses.find_by(id: params[:id])
    redirect_to  root_path unless @address
  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :spot, :telephone_number, :address, :customer_id)
  end
end
