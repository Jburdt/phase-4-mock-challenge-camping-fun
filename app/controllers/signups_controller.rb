class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # POST /signups
  def create
    @signup = Signup.create!(signup_params)
    render json: @signup.activity, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: [invalid.record.errors] }, status: :unprocessable_entity
  end

  private

  #SIGN UP PARAMS
  def signup_params
    params.permit(:time, :camper_id, :activity_id)
  end

end
