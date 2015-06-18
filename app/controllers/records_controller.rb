class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_klass!

  def index
  end

  private

  def require_klass!
    if current_user.klass.nil?
      redirect_to home_path
      flash[:alert] = "所属するクラスを登録してください。"
    end
  end
end
