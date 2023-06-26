class PizzasController < ApplicationController

  class DirectorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
      directors = Pizza.all
      render json: directors
    end

    def show
      director = Pizza.find(params[:id])
      render json: director
    end

    private

    def render_not_found_response
      render json: { error: "Director not found" }, status: :not_found
    end

  end

end
