class Public::ItemsController < ApplicationController
  def index
    if params[:search].present?
      @items = Item.search(params[:search]).order('id DESC').page(params[:page]).per(3)
    else
      @items = Item.all.order('id DESC').page(params[:page]).per(3)
    end
    #@items = Item.all
    #genre_ids = Genre.search(params[:search]).pluck(:id)
    #@items = @items.where(genre_id: genre_ids).order('id DESC').limit(8).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :shape, :size, :last_price, :favorite, :is_active, :image, :amount)
    end
end
