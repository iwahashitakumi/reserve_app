class Users::ProfilesController < ApplicationController
  def index
    @users = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :image, :introduction))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to users_profiles_path
    else
      redirect_to users_profiles_path
    end
  end
end