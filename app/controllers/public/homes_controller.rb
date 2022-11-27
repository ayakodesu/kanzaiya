class Public::HomesController < ApplicationController
  def top
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end
end
