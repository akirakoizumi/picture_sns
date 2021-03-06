# frozen_string_literal: true

# ユーザーアカウントの管理
class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update edit_password destroy]
  before_action :correct_user,   only: %i[edit update edit_password destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

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
      redirect_back_or @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def edit_password
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # if @user.update_attributes(user_params)
    if @user.update!(user_params)
      flash[:success] = 'アカウント情報を編集しました。'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def update_password
    @user = User.find(params[:id])
    if @user.update_attributes(user_params_password_only)
      flash[:success] = 'パスワードを変更しました。'
      redirect_to @user
    else
      render 'edit_password_user'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'アカウントを削除しました。'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :website, :bio, :email,
                                 :phone_number, :gender, :password, :password_confirmation, :image)
  end

  def user_params_password_only
    params.require(:user).permit(:password, :password_confirmation)
  end

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = 'ログインしてください'
    redirect_to login_url
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
