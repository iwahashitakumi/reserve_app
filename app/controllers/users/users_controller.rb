class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user
  end

  def account
    @users = current_user
  end

  def edit
    @user = User.find(params[:users_id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :image, :introduction))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to users_profile_index_path
    else
      render "edit"
    end
  end
end
