class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @food_new = Food.new
    @foods = @user.foods
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
