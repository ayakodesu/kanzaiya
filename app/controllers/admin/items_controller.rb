class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:search].present?
      @items = Item.search(params[:search]).order('id DESC').page(params[:page]).per(10)
    elsif params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(10)
    elsif params[:amount].present?
      @items = Item.where(amount: params[:amount]).page(params[:page]).per(10)
    elsif params[:amount].present?
      #@items = Item.where(amount: ..10).page(params[:page]).per(10)
    else
      @items = Item.all.order('id DESC').page(params[:page]).per(10)
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:info] = "商品を新規登録しました"
      redirect_to admin_items_path
    else
      render :new
    end
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
    if  @item.update(item_params)
        flash[:success] = "変更を保存しました"
        redirect_to admin_item_path(@item.id)
    else
        render :edit
    end
  end

  #def destroy
    #@item = Item.find(params[:id])
    #@item.delete
    #redirect_to admin_items_path
  #end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :shape, :size, :last_price, :favorite, :is_active, :image, :amount)
    end
end
