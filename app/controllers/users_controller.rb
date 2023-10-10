class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]

  def feed
    if @user != current_user
      redirect_to root_path, alert: "You are not authorized to access this page."
    else
      @posts = @user.feed
    end
  end

  def discover
    if @user != current_user
      redirect_to root_path, alert: "You are not authorized to access this page."
    else
      @posts = @user.discover
    end
  end

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end
end
