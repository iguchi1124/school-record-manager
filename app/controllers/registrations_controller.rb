class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb "ホーム", :home_path

  def index
    add_breadcrumb "学校選択", :registrations_path
    @schools = School.all
  end

  def school
    add_breadcrumb "学校選択", :registrations_path
    add_breadcrumb "クラス選択", :registrations_school_path
    @school = School.find(params[:id])
  end

  def klass
    add_breadcrumb "学校選択", :registrations_path
    add_breadcrumb "クラス選択", :registrations_school_path
    add_breadcrumb "クラス認証", :registrations_klass_path
    @klass = Klass.find(params[:id])
  end

  def authenticate
    klass = Klass.find(params[:id])

    if klass.authenticate(params[:password])
      current_user.save_klass!(klass)
      flash[:notice] = '認証しました。'
      redirect_to home_path
    else
      flash[:alert] = 'パスワードが間違っています。'
      redirect_to registrations_klass_path(params[:id])
    end
  end
end
