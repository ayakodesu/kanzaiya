class GeneralPublic::FavoritesController < ApplicationController
  before_action :authenticate_general_customer!

  def index
    @favorite = current_general_customer.favorites
    @favorites = current_general_customer.favorites.page(params[:page]).per(5)
  end

  def create
    @favorite = current_general_customer.favorites.create(item_id: params[:item_id])
     redirect_back(fallback_location: general_public_items_path)
  end

  def destroy
    @item = Item.find(params[:item_id])
    @favorite = current_general_customer.favorites.find_by(item_id: @item.id)
      @favorite.destroy
        redirect_back(fallback_location: general_public_items_path)
  end

  private
    def favorite_params
      params.require(:favorite).permit(:general_genre_id, :item_id, :name, :shape, :size, :last_price, :image, :amount)
    end
end
