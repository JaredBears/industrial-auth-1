class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]

  def feed
    authorize @user
    @posts = @user.feed
  end

  def discover
    authorize @user
    @posts = @user.discover
  end

  def show
    authorize @user
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
