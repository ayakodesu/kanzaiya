class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
   @order = Order.find(params[:id])
   @order_details = @order.order_details
  end

  def index
    #@order = Order.new
    #@customers = Order.all
    #@general_customers = Order.all
    #@instances = Order.all.order('id DESC').page(params[:page])
    #@instances = Order.all
    if params[:search].present?
      @instances = Order.searchs(params[:search]).page(params[:page]).per(10).order(created_at: 'DESC')
    else
      @instances = Order.all.page(params[:page]).per(10).order(created_at: 'DESC')
    end
  end


  private

  def order_params
    params.require(:order).permit(:genre_id, :last_name, :corporation, :first_name, :spot, :name, :size, :shape, :introduction, :price, :is_active, :image, :customer_id, :general_customer_id)
  end
end
