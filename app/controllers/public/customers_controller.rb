class Public::CustomersController < ApplicationController
  def show
    @items = Item.order('id DESC').limit(6)
  end

  def edit
  end
end
