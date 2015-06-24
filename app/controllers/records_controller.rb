class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_klass!
  before_action :require_records!

  def index
    @subjects = current_user.klass.subjects
    @record_terms = Record.terms.values
  end

  def registration
  end

  def update
    test_scores, record_ids = params[:test_scores], params[:record_ids]
    test_scores.each_with_index do |score, i|
      record = Record.find(record_ids[i])
      record.update!(test_score: score)
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
