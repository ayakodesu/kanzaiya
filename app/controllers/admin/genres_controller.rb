class Admin::GenresController < ApplicationController

  def new
   @genre = Genre.new
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path(@genre.id)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path(@genre.id)
  end






  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end

