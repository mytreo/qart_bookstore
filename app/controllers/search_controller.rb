class SearchController < ApplicationController
  def search
    @search_string=params[:search_string]
    @books = Book.where("name like ?",('%'+@search_string+'%'))
  end
end
