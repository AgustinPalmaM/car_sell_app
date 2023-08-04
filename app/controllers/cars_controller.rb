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

  def edit
    @car = Car.find(params[:id])
  end
  
  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      flash[:notice] = "Edited succesfully"
      redirect_to car_path(@car)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])

    return unless @car.destroy

    flash[:notice] = "Deleted ok"
    redirect_to cars_path, status: :found
  end

  private

  def car_params
    params.require(:car).permit(:registration, :brand, :version, :model, :year, :color, :price,
                                :transmission, :traction, :fuel, :photo)
  end
end
