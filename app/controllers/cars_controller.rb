class CarsController < ApplicationController
  def index
    @categories = Category.order(name: :asc).load_async
    @cars = Car.with_attached_photo.order(created_at: :desc).load_async
    if params[:category_id]
      @cars = Car.where(category_id: params[:category_id])
    end
  end

  def show
    car
  end

  def new
    @car = Car.new
  end

  def edit
    car
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = t(".created")
      redirect_to car_path(@car)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def update
    if car.update(car_params)
      flash[:notice] = t(".edited")
      redirect_to car_path(car)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    return unless car.destroy

    flash[:notice] = t(".deleted")
    redirect_to cars_path, status: :found
  end

  private

  def car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:registration, :brand, :version, :model, :year, :color, :price,
                                :transmission, :traction, :fuel, :photo, :category_id)
  end
end
