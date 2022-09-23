class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def show
    toy = Toy.find(params[:id])
    if toy
      render json: toy, status: :found
    else
      render json: { error: "Toy not found" }, status: :not_found
    end
  end

  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private

  def toy_params
    params.permit(:name, :image, :likes)
  end

end
