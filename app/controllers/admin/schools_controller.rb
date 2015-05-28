class Admin::SchoolsController < Admin::Base
  before_action :set_school, only: %i(show edit update destroy)

  def index
    @schools = School.includes(:klasses).all
  end

  def show
  end

  def new
    @school = School.new
  end

  def edit
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to admin_school_path(@school)
      flash[:notice] = 'School was successfully created.'
    else
      render :new
    end
  end

  def update
    if @school.update(school_params)
      redirect_to admin_school_path(@school)
      flash[:notice] = 'School was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to admin_schools_url
    flash[:notice] = 'School was successfully destroyed.'
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :prefecture)
  end
end
