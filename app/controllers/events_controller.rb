class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
  end

  def find
    if event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy

    redirect_to dashboard_path
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :location,
      :date,
      :time,
      :user_id
    ).merge(user: current_user)
  end
end
