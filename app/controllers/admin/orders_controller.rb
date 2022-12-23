class Admin::OrdersController < ApplicationController

  def show
   @order = Order.find(params[:id])
   @order_details = @order.order_details
  end


  def index
    @order = Order.new
    #@orders = Order.all
    @customer = Order.all
    @general_customer = Order.all
    @instances = @customer | @general_customer
    #@order_details = OrderDetail.page(params[:page])
    @order_details = @order.order_details

  end

  private

  def order_params
    params.require(:order).permit(:genre_id, :last_name, :first_name, :name, :size, :shape, :introduction, :price, :is_active, :image, :customer_id, :general_customer_id)
  end

end
