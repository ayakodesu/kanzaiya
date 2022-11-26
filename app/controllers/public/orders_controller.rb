class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

private
  def order_params
    params.require(:order).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end

end
