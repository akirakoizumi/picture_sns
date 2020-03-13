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
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザー登録が完了しました。'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'アカウント情報を編集しました。'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :website, :bio, :email,
                                 :phone_number, :gender, :password, :password_confirmation)
  end

  def user_params2
    params.require(:user).permit(:name, :username, :website, :bio, :email,
                                 :phone_number, :gender)
  end
end
