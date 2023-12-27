class CarsController < ApplicationController
  skip_before_action :protect_pages, only: %i[index show]

  def index
    @categories = Category.order(name: :asc).load_async

    @pagy, @cars = pagy_countless(FindCars.new.call(car_params_index).load_async, items: 4)
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

  def car_params_index
    params.permit(:category_id, :min_price, :max_price, :query_text, :order_by, :page)
  end
end
