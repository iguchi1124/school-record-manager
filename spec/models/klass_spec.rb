# == Schema Information
#
# Table name: klasses
#
#  id              :integer          not null, primary key
#  name            :string
#  school_id       :integer
#  password        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

require 'rails_helper'

RSpec.describe Klass, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:subjects) }
    it { is_expected.to belong_to(:school) }
  end
end
