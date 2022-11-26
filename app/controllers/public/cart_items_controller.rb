class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end



    def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if cart_item.present?
          cart_item.amount += params[:cart_item][:amount].to_i
            cart_item.update(amount: cart_item.amount)
              redirect_to public_cart_items_path
    elsif new_cart_item.save
      redirect_to public_cart_items_path
    else
      redirect_to public_cart_items_path
    end
    end

    private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
