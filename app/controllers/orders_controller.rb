class OrdersController < ApplicationController
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :update]
  before_action :signed_in_user, only: [:index]

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
    @order.change_quantity(@cart.line_items)
    @order.add_line_items_from_cart(@cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id]=nil
      flash[:success] = 'Order was successfully created. Thank you :-)'
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_order
    @order = Order.find_by_id(params[:id])
  end

  def set_cart
  @cart=current_cart
  end

  def order_params
    params.require(:order).permit(:name, :address, :email, :user_id)
  end
end