class AttendancesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    current_user.attendances(event)
    Attendance.new

    redirect_to :back
  end

  def destroy
    @Event = current_event
    current_user.attendance.delete(@event)

    redirect_to :back
  end

  def show
    redirect_to dashboard_path
  end

  def index
    attendances.each
  end

    private

  def current_event
    Event.find(params[:event_id])
  end
end
