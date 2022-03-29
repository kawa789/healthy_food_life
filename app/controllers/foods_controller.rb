class FoodsController < ApplicationController
  before_action :authenticate_user! #ユーザーがログインしているかどうか確認
  before_action :ensure_user, only: [:edit, :update, :destroy] #投稿したユーザーのみ編集、削除可能

  def index
    @foods = Food.all
    @food = Food.new
    @user = current_user
  end

  def show
    @food = Food.find(params[:id])
     @food_new = Food.new
    @food_comment = FoodComment.new
    @user = current_user

  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id #どのユーザーが投稿したのか紐付け
    if @food.save #バリデーションの追加
       flash[:notice] = '投稿が完了しました！'
      redirect_to foods_path
    else
      @foods = Food.all
      render :index
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to foods_path
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    food = Food.find(params[:id])
    if food.update(food_params)
    flash[:notice] = '更新が完了しました！'
    redirect_to foods_path(food)
    else
      render :edit
    end
  end

  private
  def food_params
    params.require(:food).permit(:title, :body)
  end

  def ensure_user
    @foods = current_user.foods
    @food = @foods.find_by(id: params[:id])
    redirect_to foods_path unless @food
  end

end