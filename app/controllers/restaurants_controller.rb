class RestaurantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

  def index
    restaurants = Restaurant.all
    render json: restaurants, except: [:created_at, :updated_at], status: :ok
  end

  def show
    restaurant = find_restaurant
    render json: restaurant, include: { pizzas: { only: [:id, :name, :ingredients] } }, except: [:created_at, :updated_at], status: :ok
  end

  def create
    new_restaurant = Restaurant.create!(valid_params)
    render json: new_restaurant, except: [:created_at, :updated_at], status: :created
  end

  def update
    restaurant = find_restaurant
    restaurant.update!(valid_params)
    render json: restaurant, except: [:created_at, :updated_at], status: :accepted
  end

  def destroy
    restaurant = find_restaurant
    restaurant.destroy
    head :no_content
  end

  private

  def find_restaurant
    Restaurant.find(params[:id])
  end

  # def valid_params
  #   params.permit(:id, :name , :address)
  # end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def unprocessable_entity_response(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end
