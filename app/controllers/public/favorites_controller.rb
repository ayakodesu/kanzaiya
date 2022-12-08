class Public::FavoritesController < ApplicationController
  def index
  end

  def create
     favorite = current_cutomer.favorites.build(record_id: params[:record_id])
   if favorite.save
    redirect_back(fallback_location: public_path)
   else
     @record = facorite.record
     favorite = @record.favorite
     redirect_back(fallback_location: public_path)
   end

  end

  def destroy
    customer = current_cutomer
   record=Record.find(params[:record_id])
   if favorite=Favorite.find_by(customer_id: customer.id,record_id:record.id)
    favorite.destroy
    redirect_back(fallback_location: public_path)
   else
    redirect_back(fallback_location: public_path)
   end
  end
end
