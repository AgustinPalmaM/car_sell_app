class FavoritesController < ApplicationController
  def create
    Favorite.create(car: car, user: Current.user)
    redirect_to car_path(car)
  end

  def destroy
    car.favorites.find_by(user: Current.user)&.destroy
    redirect_to car_path(car), status: :see_other
  end

  private

  def car
    @car ||= Car.find(params[:car_id])
  end
end