class GeneralPublic::CartItemsController < ApplicationController

  def index
    @cart_items = current_general_customer.cart_items
    @total = 0
  end

  def create
    new_cart_item = current_general_customer.cart_items.new(cart_item_params)
    cart_item = current_general_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if cart_item.present?
          cart_item.amount += params[:cart_item][:amount].to_i
            cart_item.update(amount: cart_item.amount)
              redirect_to public_cart_items_path
    elsif new_cart_item.save
      redirect_to general_public_cart_items_path
    else
      redirect_to general_public_cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to general_public_cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to general_public_cart_items_path
  end



private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end