class EventsController < ApplicationController
  def index
    @event = Event.all
    redirect_to :back
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      @event.errors.full_messages
      redirect_to dashboard_path
    else
      redirect_to :back
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

    if event.update(event_params)
      redirect_to event_path
    else
      redirect_to :back
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy

    redirect_to dashboard_path
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
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
