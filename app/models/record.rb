# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subject_id :integer
#  test_score :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  term       :integer
#

class Record < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user

  validates :test_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  enum term: { first_term: 1, second_term: 2, third_term: 3, fourth_term: 4 }
end
