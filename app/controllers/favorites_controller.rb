class FavoritesController < ApplicationController
  def index
    
  end
  
  def create
    car.favorite!
    redirect_to car_path(car)
  end

  def destroy
    car.unfavorite!
    redirect_to car_path(car), status: :see_other
  end

  private

  def car
    @car ||= Car.find(params[:car_id])
  end
end