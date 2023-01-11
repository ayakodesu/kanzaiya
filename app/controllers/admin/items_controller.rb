class Admin::ItemsController < ApplicationController
  def index
    if params[:search].present?
      @items = Item.search(params[:search]).order('id DESC').page(params[:page]).per(3)
    else
      @items = Item.all.order('id DESC').page(params[:page]).per(3)
    end
    #genre_ids = Genre.search(params[:search]).pluck(:id)
    #@items = @items.where(genre_id: genre_ids).order('id DESC').limit(8).page(params[:page])
    #@items = Item.search(params[:search]).order('id DESC').limit(8).page(params[:page])
  end

  def create
    @item = Item.new(item_params)
    @item.save!
      flash[:info] = "商品を新規登録しました"
    redirect_to admin_items_path
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
    redirect_to admin_item_path(@item.id)
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :shape, :size, :last_price, :favorite, :is_active, :image, :amount)
    end
end
