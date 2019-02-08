class Employer < ActiveRecord::Base
  belongs_to :user
  has_many :jobs
  has_many :applications, through: :jobs

  validates :name, presence: true
  validates :user_id, presence: true
end
