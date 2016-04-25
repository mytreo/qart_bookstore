class BooksController < ApplicationController
  before_action :get_genres_and_authors, only: [:new, :edit, :create, :update]
  before_action :check_is_current_user_admin?, only:[:new, :create, :edit, :update, :destroy]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.paginate(page: params[:page], :per_page => 5)
    @books = @books.includes(:authors).order(params[:sort])
  end

  def show
    if @book
      render 'books/show'
    else
      render_404
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book created"
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update_attributes(book_params)
      flash[:success] = "Book updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    flash[:success] = "Book deleted."
    redirect_to books_url
  end

  private
    def set_book
      @book = Book.find_by_id(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :price, :quantity,:sold, :year,:isbn,:description,:genre_id,:cover,:cover_file_name, :author_ids => [])
    end

    def get_genres_and_authors
      @genres ||= Genre.all
      @authors ||= Author.all
    end

end