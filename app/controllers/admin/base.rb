class Admin::Base < ApplicationController
  before_action :authenticate_staff_user!

  private

  def authenticate_staff_user!
    redirect_to root_path unless user_signed_in? && current_user.staff?
  end
end
