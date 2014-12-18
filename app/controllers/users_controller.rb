class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @user = User.each
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  def update
    @user = current_user
    current_user.update_attributes(update_user_params)
    redirect_to edit_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def update_user_params
    params.require(:user).permit(:address)
  end
end
