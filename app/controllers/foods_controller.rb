class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
    @food_comment = FoodComment.new
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save #バリデーションの追加
      redirect_to foods_path
    else
      render :new
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
    food.update(food_params)
    redirect_to foods_path(food)
  end

  private
  def food_params
    params.require(:food).permit(:title, :body)
  end
end

