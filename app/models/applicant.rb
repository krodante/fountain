class Applicant < ActiveRecord::Base
  belongs_to :user
  has_many :applications
  has_many :jobs, through: :applications
end
