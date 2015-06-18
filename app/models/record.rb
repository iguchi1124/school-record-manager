# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subject_id :integer
#  test_score :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Record < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
end
