class Public::FavoritesController < ApplicationController
  def index
  end



  def create
    @item = Item.find(params[:item_id])
    favorite = current_customer.favorites.new(item_id: item.id)
    favorite.save
      redirect_to public_items_path(item)
  end


  def destroy
    @item = Item.find(params[:item_id])
    favorite = current_genera_customer.favorites.find_by(item_id: item.id)
      favorite.destroy
        redirect_to public_items_path(item)
  end


  #private

  #def set_item
   #@item = Item.find(params[:item_id])
  #end


end
