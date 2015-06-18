# == Schema Information
#
# Table name: subjects
#
#  id           :integer          not null, primary key
#  klass_id     :integer
#  name         :string
#  teacher_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Subject < ActiveRecord::Base
  belongs_to :klass
  has_many :records

  validates_presence_of :klass, :name
end
