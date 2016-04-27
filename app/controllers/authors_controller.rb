class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_action :check_is_current_user_admin?, only:[:index,:new, :create, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
    @books = Book.joins("join authors_books on books.id = authors_books.book_id").where(["authors_books.author_id = ?", @author.id]).order(params[:sort])
    @books = @books.paginate(page: params[:page], :per_page => 10)
    @genres =Genre.select("genres.id, genres.name, sum(1) s").joins(books: :authors).where("authors.id = ?", @author.id).group(:id,:name)
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Author created"
      redirect_to @author
    else
      render :new
    end
  end

  def update
    if @author.update(author_params)
      flash[:success] = "Author updated"
      redirect_to @author
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    flash[:success] = "Author destroyed"
    redirect_to authors_url
  end

  private
  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name,:description)
  end
end
