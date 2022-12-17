class Admin::OrdersController < ApplicationController

  def show
   @order = Order.find(params[:id])
   @order_details = OrderDetail.page(params[:page])
  end

  def index
    @order = Order.new
    #@orders = Order.all
    @customer = Customer.all
    @general_customer = GeneralCustomer.all
    @instances = @customer | @general_customer
  end

  private

  def order_params
    params.require(:order).permit(:genre_id, :last_name, :first_name, :name, :introduction, :price, :is_active, :image)
  end

end
