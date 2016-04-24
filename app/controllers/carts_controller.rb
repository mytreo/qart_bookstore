class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :destroy]

  def show
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart.destroy
    flash[:success] = "Cart was successfully destroye"
    session[:cart_id]=nil
    redirect_to root_url
  end

  private
    def set_cart
      @cart = current_cart
    end

    def cart_params
      params.fetch(:cart, {})
    end
end
