module SchoolDisplayable
  extend ActiveSupport::Concern

  def index
    @schools = School.all
  end
end
