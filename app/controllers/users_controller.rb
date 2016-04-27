class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_is_current_user_admin?, only:[:index,:destroy]
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :signed_in_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
     if !@user.admin?
       @orders = Order.where("user_id = ?",@user.id)
     end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the QartBookStore"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
      if @user.update(user_params)
        flash[:success] ='User info was successfully updated.'
        redirect_to @user
      else
        render :edit
      end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:login,:email,:name,:password,:password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
