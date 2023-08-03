class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Created successfully"
      redirect_to car_path(@car)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])

    if @car.destroy
      flash[:notice] = "Deleted ok"
      redirect_to cars_path
    end
  end
  private

  def car_params
    params.require(:car).permit(:registration, :brand, :version, :model, :year, :color, :price, :transmission, :traction, :fuel)
  end

end
