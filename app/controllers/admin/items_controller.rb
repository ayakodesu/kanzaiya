class Admin::ItemsController < ApplicationController
  def index
    @item = Item.all
    @items = Item.page(params[:page])
  end

  def create
    @item = Item.new
    @item.save
    redirect_to admin_item_path(@item.id)

  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :shape, :size, :last_price, :favorite, :is_active)
end
end
