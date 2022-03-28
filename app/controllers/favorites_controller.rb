class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @food = Food.find(params[:food_id])
    favorite = @food.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @food = Food.find(params[:food_id])
    favorite = @food.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer
  end

end
