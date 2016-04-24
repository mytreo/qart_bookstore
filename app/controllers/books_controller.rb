class BooksController < ApplicationController
  before_action :get_genres_and_authors, only: [:new, :edit, :create, :update]

  def index
    @books = Book.paginate(page: params[:page])
  end

  def show
    if @book= Book.find_by_id(params[:id])
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
    @book = Book.find_by_id(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Book updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    Book.find_by_id(params[:id]).destroy
    flash[:success] = "Book deleted."
    redirect_to books_url
  end

  private

    def book_params
      params.require(:book).permit(:name, :price, :quantity,:sold, :year,:isbn,:description,:genre_id)
    end

    def render_404
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end

    def get_genres_and_authors
      @genres ||= Genre.all
      @authors ||= Author.all
    end


end