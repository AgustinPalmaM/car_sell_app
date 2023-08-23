class CarsController < ApplicationController
  def index
    @categories = Category.order(name: :asc).load_async
    @cars = Car.with_attached_photo.order(created_at: :desc).load_async
    @cars = Car.where(category_id: params[:category_id]) if params[:category_id]

    filter
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

  def range_price
    min = params[:min_price]
    max = params[:max_price]
    min..max
  end

  def filter
    if params[:min_price].present? && params[:max_price].present?
      @cars = Car.where(price: range_price)
    elsif params[:min_price].present?
      @cars = Car.where("price >= ?", params[:min_price])
    elsif params[:max_price].present?
      @cars = Car.where("price <= ?", params[:max_price])
    end
  end
end
