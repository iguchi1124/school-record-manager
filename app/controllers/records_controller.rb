class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_category!

  def index
  end

  private

  def require_category!
    if current_user.klass.nil?
      redirect_to home_path
      flash[:alert] = "所属するクラスを登録してください。"
    end
  end
end
