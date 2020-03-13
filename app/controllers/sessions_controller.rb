# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: session_params[:username])

    if user&.authenticate(session_params[:password])
      log_in user
      flash[:success] = 'ログインしました。'
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    flash[:success] = 'ログアウトしました。'
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
