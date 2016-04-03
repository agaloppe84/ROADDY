class StepsController < ApplicationController

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
    @step = Step.new(step_params)
    @step.save
  end

  def edit
    @step = Step.find(params[:id])
  end

  def update
    @step = Step.find(params[:id])
    @step.update(step_params)
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
  end

  private

  def step_params
    params.require(:step).permit(:adress, :title, :scheduled_at, :position, :category, :latitude, :longitude)
  end

end
