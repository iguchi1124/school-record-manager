# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string
#  prefecture :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :school do
    name 'NIT, Kochi College'
    prefecture 'kochi'
  end
end
