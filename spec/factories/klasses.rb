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

FactoryGirl.define do
  factory :klass do
  end
end
