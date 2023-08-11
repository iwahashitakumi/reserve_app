class Users::AccountsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user
  end
end