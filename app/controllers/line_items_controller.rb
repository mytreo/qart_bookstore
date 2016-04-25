class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:destroy]

  def create
    @cart=current_cart
    book=Book.find_by_id(params[:book_id])
    @line_item = @cart.add_book(book.id)
      if @line_item.save
        redirect_to @line_item.cart
      else
         render :new
      end
  end

  def destroy
    @line_item.destroy
    flash[:success] = "Line item was successfully destroyed."
    redirect_to current_cart
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:book_id, :cart_id)
    end
end
