class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /activites
  def index
    @activities = Activity.all 
    render json: @activities, only: [:id, :name, :difficulty]
  end

  #DELETE /activites/:ID
  def destroy
    @activity = find_activity
    @activity.destroy
    head:no_content
  end

  private

  # NOT FOUND MESSAGE/ STATUS
  def render_not_found_response
    render json: { error: "Activity not found" }, status: :not_found
  end

  #FIND ALL ACTIVITIES
  def find_activity
    Activity.all.find(params[:id])
  end

end
