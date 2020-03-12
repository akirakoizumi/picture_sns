# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: session_params[:username])

    if user&.authenticate(session_params[:password])
      log_in user
      flash[:success] = 'ログインしました。'
      remember user
      redirect_to user
    else
      flash.now[:danger] = session_params[:username].to_s
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = 'ログアウトしました。'
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
