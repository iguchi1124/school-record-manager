class RecordsController < ApplicationController
  before_action :authenticate_user!, :require_klass!
  before_action :set_term, :require_records!, except: %i(index)
  before_action :set_records, only: %i(show registration)

  def index
    @subjects = current_user.klass.subjects
    @record_terms = Record.terms.values
  end

  def show
  end

  def registration
  end

  def update
    test_scores, record_ids = params[:test_scores], params[:record_ids]
    test_scores.each_with_index do |score, i|
      record = Record.find(record_ids[i])
      record.update!(test_score: score)
    end

    redirect_to record_path(@term)
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
    current_user.require_records!(@term)
  end

  def set_term
    @term = params[:term_id].to_i
  end

  def set_records
    @records = current_user.records.where(term: @term)
  end
end
