class Admin::OrdersController < ApplicationController
  def show
  end

  def index
    @orders = Order.find(params[:id])
  end
end
