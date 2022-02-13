class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end
  
  def create
    food = Food.new(food_params)
    food.save
    redirect_to foods_path
  end
  
  def destroy
  end

  def edit
  end
  
  def update
  end
  
  private
  def food_params
    params.require(:food).permit(:title, :body)
  end
  
end
