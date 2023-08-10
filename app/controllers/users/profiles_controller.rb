class Users::ProfilesController < ApplicationController
  def index
    @users = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    binding.pry
    if @user.update(params.require(:user).permit(:name, :image, :introduction))
      binding.pry
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to users_profiles_index_path
    else
      render "edit"
    end
  end
end