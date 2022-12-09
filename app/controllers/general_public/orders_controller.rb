class GeneralPublic::OrdersController < ApplicationController
  def new
  end

  def index
    @orders = current_general_customer.orders.page(params[:page])
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
