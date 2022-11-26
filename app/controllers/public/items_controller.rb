class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end


  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :shape, :size, :last_price, :favorite, :is_active, :image, :amount)
    end


end
