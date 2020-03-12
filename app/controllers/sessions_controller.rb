# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: session_params[:username])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = 'ログインしました。'
      redirect_to user_path(user)
    else
      flash.now[:danger] = session_params[:username].to_s
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
