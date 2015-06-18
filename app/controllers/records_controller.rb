class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_klass!
  before_action :require_records!

  def index
  end

  def registration
  end

  def update
    test_scores = params[:test_scores]
    subject_ids = params[:subject_ids]
    test_scores.each_with_index do |score, i|
      record = current_user.klass.subjects.find(subject_ids[i]).records.find_by(user: current_user)
      record.update(test_score: score)
    end

    redirect_to registration_records_path
    flash[:notice] = "更新しました。"
  end

  private

  def require_klass!
    if current_user.klass.nil?
      redirect_to home_path
      flash[:alert] = "所属するクラスを登録してください。"
    end
  end

  def require_records!
    current_user.has_records!
  end
end
