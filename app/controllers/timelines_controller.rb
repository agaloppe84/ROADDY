class TimelinesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @timelines = Timeline.all
    if params[:destination]
      @timelines = Step.near(params[:destination], 300).map(&:timeline).uniq
    end
  end

  def show
    @timeline = Timeline.find(params[:id])
    @timeline.steps.each do |step|
      unless step.last?
        step.distance_with_next_step = Geocoder::Calculations.distance_between(step.to_lat_lng, step.lower_item.to_lat_lng)
      end
    end
    @markers = Gmaps4rails.build_markers(@timeline.steps) do |step, marker|
      marker.lat step.latitude
      marker.lng step.longitude
    end
  end

  def new
    @timeline = current_user.timelines.create
    redirect_to edit_timeline_path(@timeline)
  end

  def edit
    @step = Step.new
    @timeline = current_user.timelines.find(params[:id])
  end

  def update
    @timeline = current_user.timelines.find(params[:id])
    @timeline.update(timeline_params)
    redirect_to edit_timeline_path(@timeline)
  end

  def destroy
    @timeline = current_user.timelines.find(params[:id])
    @timeline.destroy
  end

  private

  def timeline_params
    params.require(:timeline).permit(:title, :start_date, :end_date, :destination, :budget, :latitude, :longitude)
  end

end
