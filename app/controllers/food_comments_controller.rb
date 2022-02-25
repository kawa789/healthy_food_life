class FoodCommentsController < ApplicationController

  def create
    @food = Food.find(params[:food_id])
    @food_comment = FoodComment.new(food_comment_params)
    @food_comment.user_id = current_user.id
    @food_comment.food_id = @food.id
    @food_comment.save
    redirect_to food_path(food)

  end

  def destroy
    @food = Food.find(params[:food_id])
    food_comment = @food.food_comments.find(params[:id])
    food_comment.destroy
    redirect_to food_path(params[:food_id])
  end

  private

  def food_comment_params
    params.require(:food_comment).permit(:comment)
  end

end
