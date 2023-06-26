class RestaurantPizzasController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

  def index
    restaurant_pizzas = RestaurantPizza.all
    render json: restaurant_pizzas, except: [:created_at, :updated_at], status: :ok
  end

  def show
    restaurant_pizzas = find_pizza
    render json: pizza, except: [:created_at, :updated_at], status: :ok
  end

  def create
    restaurant_pizzas = RestaurantPizza.create!(valid_params)
    render json: restaurant_pizzas, except: [:created_at, :updated_at], status: :created
  end

  def destroy
    restaurant_pizzas = find_pizza
    restaurant_pizzas.destroy
    head :no_content
  end


  private

  def find_pizza
    RestaurantPizza.find(params[:id])
  end

  def valid_params
    params.permit(:id, :name , :address)
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def unprocessable_entity_response(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end


end
