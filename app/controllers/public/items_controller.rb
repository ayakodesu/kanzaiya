class Public::ItemsController < ApplicationController
  def index
    if params[:search].present?
      @items = Item.search(params[:search]).order('id DESC').page(params[:page]).per(10)
    elsif params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(10)
    else
      @items = Item.all.order('id DESC').page(params[:page]).per(10)
    end
  end

  def search
    @items = Items.where('genre_id LIKE ?', "%#{params[:name]}%")
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
