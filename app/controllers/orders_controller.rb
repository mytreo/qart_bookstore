class OrdersController < ApplicationController
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :update]
  before_action :check_is_current_user_admin?, only: [:index,:show]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    if @cart.line_items.empty?
      flash[:warning]='Your cart is empty'
      redirect_to root_url
      return
    end
    @order = Order.new
    if signed_in?
      @order.name = current_user.name
      @order.address = current_user.address
      @order.email = current_user.email
      @order.user_id = current_user.id
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.add_line_items_from_cart(@cart) && @order.save
      @order.line_items.each  do |item|
        item.book.quantity-=item.quantity
        item.book.sold+=item.quantity
        item.book.save
      end
      Cart.destroy(session[:cart_id])
      session[:cart_id]=nil
      flash[:success] = 'Order was successfully created. Thank you :-)'
      redirect_to root_url
    else
      flash.now[:warning] = "Can't create such order"
      render :new
    end
  end

  def update
      if @order.update_attribute(:status,params[:status])
        flash[:success] = "Order status was successfully updated."
        if params[:status].to_i < 0
          @order.line_items.each do |item|
            item.book.quantity+=item.quantity
            item.book.sold-=item.quantity
            item.book.save
          end
        end
      else
        flash[:success] = "Order status can't be updated."
      end
      redirect_to orders_url
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def set_cart
  @cart=current_cart
  end

  def order_params
    params.require(:order).permit(:name, :address, :email, :user_id, :status)
  end
end