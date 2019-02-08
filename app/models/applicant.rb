class Applicant < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :jobs, through: :applications

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_id, presence: true
end
