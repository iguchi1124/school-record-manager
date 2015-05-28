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

class Klass < ActiveRecord::Base
  has_secure_password
  belongs_to :school
end
