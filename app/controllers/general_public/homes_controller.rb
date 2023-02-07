class GeneralPublic::HomesController < ApplicationController
before_action :authenticate_general_customer!

  def top
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end
end
