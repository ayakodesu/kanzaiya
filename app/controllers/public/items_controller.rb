class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    #@genres = Genre.all.page(params[:page])
    #@items = Item.all.search(params[:search])
    # byebug
    genre_ids = Genre.search(params[:search]).pluck(:id)
    @items = @items.where(genre_id: genre_ids).order('id DESC').limit(8)


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
