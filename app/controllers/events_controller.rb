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
    @event = current_event
    current_event.update_attributes(update_event_params)
    redirect_to edit_event_path
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy

    redirect_to dashboard_path
  end

  private

  def find
    if event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :location,
      :date,
      :id,
      :time,
      :user_id,
      :address
    ).merge(user: current_user)
  end

  def update_event_params
    params.require(:event).permit(:address)
  end
end
