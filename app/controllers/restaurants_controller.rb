class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  # GET / restaurants

  def index
    @restaurants = Restaurant.all
  end

  # GET / restaurants/1
  def show
  end

  # GET / restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @restaurant.update(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def category
    @category = params[:category]
    @restaurants = Restaurant.where(category: @category[0...-1])
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
