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

require 'rails_helper'

RSpec.describe Record, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:subject) }
    it { is_expected.to belong_to(:user) }
  end
end
