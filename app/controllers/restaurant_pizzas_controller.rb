class RestaurantPizzasController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

  def index
    pizzas = Pizza.all
    render json: pizzas, except: [:created_at, :updated_at], status: :ok
  end

  def show
    pizza = find_pizza
    render json: pizza, except: [:created_at, :updated_at], status: :ok
  end



  private

  def find_pizza
    Pizza.find(params[:id])
  end



  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def unprocessable_entity_response(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end


end
