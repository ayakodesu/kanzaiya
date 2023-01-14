class Public::ItemsController < ApplicationController
  def index
    if params[:search].present?
      @items = Item.search(params[:search]).order('id DESC').page(params[:page]).per(10)
    else
      @items = Item.all.order('id DESC').page(params[:page]).per(10)
    end
    @genre = Genre.all
    @name = Genre.group(:name).pluck(:name).sort
  end

  def search
    @genres = Genre.where('name LIKE ?', "%#{params[:name]}%")
    @name = Genre.group(:name).pluck(:name).sort
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :genre_name, :name, :introduction, :shape, :size, :last_price, :favorite, :is_active, :image, :amount)
    end
end
