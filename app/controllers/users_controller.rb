class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy] #本人のみ編集、削除可能

  def index
    @users = User.all
    @food_new = Food.new
  end

  def show
    @user = User.find(params[:id])
    @food_new = Food.new
    @foods = @user.foods
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = '更新が完了しました！'
       redirect_to user_path(current_user)
    else
       render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
