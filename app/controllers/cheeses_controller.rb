class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    #render json: cheeses, only: [:id, :name, :price, :is_best_seller]
    render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
    render json: cheese
    else
      render json: { error: 'Cheese Not Found' }, status: :not_found
  end
end
end
