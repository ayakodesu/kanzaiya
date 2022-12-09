class GeneralPublic::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all.page(params[:page])
    @items = Item.order('id DESC').limit(8)
  end

  def show
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :shape, :size, :last_price, :favorite, :is_active, :image, :amount)
    end
end
