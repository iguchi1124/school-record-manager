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

require 'rails_helper'

RSpec.describe Subject, type: :model do
  it { is_expected.to belong_to(:klass) }
  it { is_expected.to have_many(:records) }
end
