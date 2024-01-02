class FavoritesController < ApplicationController
  def create
    Favorite.create(car: car, user: Current.user)
    redirect_to car_path(car)
  end

  private

  def car
    @car ||= Car.find(params[:car_id])
  end
end