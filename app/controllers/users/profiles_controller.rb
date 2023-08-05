class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:name, :image, :introduction))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to users_profiles_index_path
    else
      render "edit"
    end
  end
end