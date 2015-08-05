class HomeController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb "ホーム", :home_path

  def index
  end
end
