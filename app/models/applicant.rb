class Applicant < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :jobs, through: :applications
end
