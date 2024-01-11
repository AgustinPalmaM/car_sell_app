class FavoritesController < ApplicationController
  def index
    
  end
  
  def create
    car.favorite!
    respond_to do |format|
      format.html do
        redirect_to car_path(car)
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("favorite", partial: "cars/favorite", locals: { car: car })
      end
    end
  end

  def destroy
    car.unfavorite!
    respond_to do |format|
      format.html do
        redirect_to car_path(car), status: :see_other
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("favorite", partial: "cars/favorite", locals: { car: car })
      end
    end
  end

  private

  def car
    @car ||= Car.find(params[:car_id])
  end
end