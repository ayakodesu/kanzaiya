class Admin::ItemsController < ApplicationController
  def index
    @item = Item.all
    @items = Item.page(params[:page])
    genre_ids = Genre.search(params[:search]).pluck(:id)
    @items = @items.where(genre_id: genre_ids).order('id DESC').limit(8).page(params[:page])
  end

  def create
    @item = Item.new(item_params)
    @item.save!
      flash[:info] = "商品を新規登録しました"
    redirect_to admin_items_path(@item.id)

  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
      flash[:success] = "変更を保存しました"
    redirect_to admin_items_path(@item.id)
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :shape, :size, :last_price, :favorite, :is_active, :image, :amount)
    end
end
