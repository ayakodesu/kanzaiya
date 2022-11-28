class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
    @customer = current_customer
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

private
  def order_params
    params.require(:order).permit(:last_name, :first_name, :address, :introduction, :price, :is_active)
  end

end
