class Public::FavoritesController < ApplicationController
  def index
  end



  def create
    @favorite = current_customer.favorites.create(item_id: params[item_id])
     redirect_back(fallback_location: public_items_path)
  end


  def destroy
    @item = Item.find(params[:item_id])
    @favorite = current_customer.favorites.find_by(item_id: @item.id)
      @favorite.destroy
        redirect_back(fallback_location: public_items_path)
  end


  #private

  #def set_item
   #@item = Item.find(params[:item_id])
  #end

private
    def favorite_params
      params.require(:favorite).permit(:genre_id, :name, :introduction, :shape, :size, :last_price, :favorite, :is_active, :image, :amount)
    end
end
