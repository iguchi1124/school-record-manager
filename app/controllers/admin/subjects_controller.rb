class Admin::SubjectsController < Admin::Base
  before_action :set_school_and_klass
  before_action :set_subject, only: %i(show edit update destroy)

  def index
    @subjects = Subject.all
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to admin_school_klass_subject_path(@school, @klass, @subject)
      flash[:notice] = 'Subject was successfully created.'
    else
      render :new
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to admin_school_klass_subject_path(@school, @klass, @subject)
      flash[:notice] = 'Subject was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    redirect_to admin_school_klass_subjects_path(@school, @klass)
    flash[:notice] = 'Subject was successfully destroyed.'
  end

  private

  def set_school_and_klass
    @school = School.find(params[:school_id])
    @klass = Klass.find(params[:klass_id])
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :teacher_name).merge(klass_id: params[:klass_id].to_i)
  end
end
