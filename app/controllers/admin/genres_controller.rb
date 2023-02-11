class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def new
   @genre = Genre.new
  end

  def index
    @genre = Genre.new
    @genres = Genre.all.order('id DESC')
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:info] = "新規ジャンルを保存しました"
      redirect_to admin_genres_path(@genre.id)
    else
      flash[:danger] = "保存できませんでした"
      redirect_to admin_genres_path
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
        flash[:success] = "変更を保存しました"
        redirect_to admin_genres_path(@genre.id)
    else
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.delete
    flash[:danger] = "削除しました"
    redirect_to admin_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end

