class RecordsController < ApplicationController
  before_action :authenticate_user!, :require_klass!
  before_action :set_term, :require_records!, except: %i(index)
  before_action :set_records, only: %i(show registration)

  add_breadcrumb "ホーム", :home_path
  add_breadcrumb "成績", :records_path

  def index
    @subjects = current_user.klass.subjects
    @record_terms = Record.terms.keys
  end

  def show
  end

  def registration
  end

  def update
    test_scores, record_ids = params[:test_scores], params[:record_ids]
    test_scores.each_with_index { |score, i| Record.find(record_ids[i]).update!(test_score: score) }
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
    current_user.require_records!(Record.terms[@term])
  end

  def set_term
    @term = params[:term]
  end

  def set_records
    @records = current_user.records.where(term: Record.terms[@term])
  end
end
