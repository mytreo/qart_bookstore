class SearchController < ApplicationController

  def search
    @search_string=params[:search_string]
    @genre_id=params[:genre_ids]
    @genres =Genre.select("genres.id, genres.name, sum(1) s").joins(:books).where("books.name like '%?%'",@search_string).group(:id, :name)
    @books = Book.where("name like ?", ('%'+@search_string+'%'))
    if @genre_id
      @books = @books.where("genre_id in (?)", @genre_id.to_i)
    end
    @books = @books.order(params[:sort])
    @books = @books.paginate(page: params[:page], :per_page => 10)
  end

end
