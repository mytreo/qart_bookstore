class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]
  before_action :check_is_current_user_admin?, only:[:new, :create, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  def show
    @books=Book.where(genre: @genre.id).order(params[:sort])
    @books = @books.paginate(page: params[:page], :per_page => 10)
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "Genre created"
      redirect_to @genre
    else
      render :new
    end
  end

  def update
    if @genre.update(genre_params)
      flash[:success] = "Genre updated"
      redirect_to @genre
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
    flash[:success] = "Genre destroyed"
    redirect_to genres_url
  end

  private
  def set_genre
    @genre = Genre.find_by_id(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

end