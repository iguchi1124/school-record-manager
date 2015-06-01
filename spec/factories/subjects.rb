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

FactoryGirl.define do
  factory :subject do
    klass nil
    name "MyString"
    teacher_name "MyString"
  end
end
