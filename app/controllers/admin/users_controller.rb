class Admin::UsersController < Admin::Base
  def index
    @users = User.all
  end

  def update_role
    @user = User.find(params[:id])
    @user.shift_role!
  end
end
