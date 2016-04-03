class StepsController < ApplicationController

  before_action :find_timeline, only: [:create]
  before_action :find_step, only: [:show, :edit, :update, :destroy, :up, :down]
  def index
    @steps = Step.all
    @markers = Gmaps4rails.build_markers(@steps) do |step, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def show
    @step = Step.find(params[:id])
    @step_coordinates = { lat: @flat.lat, lng: @flat.lng }
  end

  def new
    @step = Step.new
  end

  def create
    @step = @timeline.steps.new(step_params)
    @step.save
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def update
    @step.update(step_params)
  end

  def destroy
    @step.destroy
    respond_to do |format|
      format.js
    end
  end

  def up
    @moved = @step.move_higher
    respond_to do |format|
      format.js
    end
  end

  def down
    @moved = @step.move_lower
    respond_to do |format|
      format.js
    end
  end

  private

  def step_params
    params.require(:step).permit(:address, :title, :scheduled_at, :position, :category_id, :latitude, :longitude)
  end

  def find_step
    @step = Step.find(params[:id])
  end

  def find_timeline
    @timeline = Timeline.find(params[:timeline_id])
  end

end
