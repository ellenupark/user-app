class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render :new
    end
  end

  def show
  end

  def edit
    if !logged_in? || !@user
      redirect_to root_path
    end
  end
      
  def update
    if @user
      @user.update(user_params)

      if @user.errors.any?
        render "edit"
      else
        redirect_to user_path(@user)
      end
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def set_user
      @user = User.find_by_id(params[:id])
    end
end
