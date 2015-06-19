class Admin::KlassesController < Admin::Base
  before_action :set_school
  before_action :set_klass, only: %i(show edit update destroy)

  def index
  end

  def show
  end

  def new
    @klass = Klass.new
  end

  def edit
  end

  def create
    @klass = Klass.new(klass_params)

    if @klass.save
      redirect_to admin_school_klass_path(@school, @klass)
      flash[:notice] =  'Klass was successfully created.'
    else
      render :new
    end
  end

  def update
    if @klass.update(klass_params)
      redirect_to admin_school_klass_path(@school, @klass)
      flash[:notice] = 'Klass was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @klass.destroy
    redirect_to admin_school_klasses_path(@school)
    flash[:notice] = 'Klass was successfully destroyed.'
  end

  private

  def set_school
    @school = School.find(params[:school_id])
  end

  def set_klass
    @klass = Klass.find(params[:id])
  end

  def klass_params
    params.require(:klass).permit(:name, :password).merge(school_id: params[:school_id].to_i)
  end
end
