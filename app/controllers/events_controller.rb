class EventsController < ApplicationController
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

  def destroy
    event = Event.destroy(params[:id])

    redirect_to dashboard_path
  end

  private

  def event_params
    params.require(:event).permit(
      :date,
      :description,
      :location,
      :name,
      :time,
      :user_id
    ).merge(user: current_user)
  end
end
