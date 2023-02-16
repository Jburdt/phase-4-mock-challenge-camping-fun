class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /campers
  def index
    @camper = Camper.all 
    render json: @camper, only: [:id, :name, :age]
  end

  # GET /campers/:id
  def show
    @camper = Camper.find(params[:id])
    render json: @camper, only: [:id, :name, :age], include: ['activities']
  end

  #POST /campers
  def create
    @camper = Camper.create!(camper_params)
    render json: @camper, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  private

  #error message
  def render_not_found_response
    render json: { error: "Camper not found" }, status: :not_found
  end

  #camper params
  def camper_params
    params.permit(:name, :age)
  end

end
