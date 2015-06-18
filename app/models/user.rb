# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer          default(0)
#  klass_id               :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :klass
  has_many :records

  enum role: %i(student staff)

  def shift_role!
    case role
    when 'student'
      staff!
    when 'staff'
      student!
    end
  end

  def save_klass!(_klass)
    self.klass = _klass
    save!
  end

  def has_records!
    klass.subjects.each do |subject|
      records.build(subject: subject) unless subject.records.exists?(user: self)
    end
    save!
  end
end
