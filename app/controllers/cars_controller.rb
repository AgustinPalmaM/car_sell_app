class CarsController < ApplicationController
  def index
    @categories = Category.order(name: :asc).load_async
    @cars = Car.with_attached_photo
    @cars = Car.where(category_id: params[:category_id]) if params[:category_id]

    filter
    
    @pagy, @cars = pagy_countless(@cars, items: 4)

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
      @cars = params[:query_text].present? ? Car.where(price: range_price).whose_name_starts_with(params[:query_text]) : Car.where(price: range_price)
    elsif params[:min_price].present?
      @cars = if params[:query_text].present?
                Car.where("price >= ?",
                          params[:min_price]).whose_name_starts_with(params[:query_text])
              else
                Car.where("price >= ?",
                          params[:min_price])
              end
    elsif params[:max_price].present?
      @cars = if params[:query_text].present?
                Car.where("price <= ?",
                          params[:max_price]).whose_name_starts_with(params[:query_text])
              else
                Car.where("price <= ?",
                          params[:max_price])
              end
    elsif params[:query_text].present?
      @cars = Car.whose_name_starts_with(params[:query_text])
    end

    order_by = Car::ORDER_BY.fetch(params[:order_by]&.to_sym, Car::ORDER_BY[:newest])

    @cars = @cars.order(order_by).load_async

    
  end
end
