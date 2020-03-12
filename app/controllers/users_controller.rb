# frozen_string_literal: true

# ユーザーアカウントの管理
class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # 実装は終わっていないことに注意!
    if @user.save
      flash[:success] = 'ユーザー登録が完了しました。'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end
end
