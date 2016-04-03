class TimelinesController < ApplicationController

  def index
    @timelines = Timeline.all
    if params[:destination]
      @timelines = Step.near(params[:destination], 300).map(&:timeline).uniq
    end
  end

  def show
    @timeline = Timeline.find(params[:id])
    @markers = Gmaps4rails.build_markers(@timeline.steps) do |step, marker|
      marker.lat step.latitude
      marker.lng step.longitude
    end
  end

  def new
    @timeline = Timeline.new
  end

  def create
    @timeline = Timeline.new(timeline_params)
    @timeline.save
  end

  def edit
    @timeline = Timeline.find(params[:id])
  end

  def update
    @timeline = Timeline.find(params[:id])
    @timeline.update(timeline_params)
  end

  def destroy
    @timeline = Timeline.find(params[:id])
    @timeline.destroy
  end

  private

  def timeline_params
    params.require(:timeline).permit(:start_date, :end_date, :destination, :budget, :latitude, :longitude)
  end

end
