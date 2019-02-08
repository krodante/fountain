class Job < ApplicationRecord
  belongs_to :employer
  has_many :applications
  has_many :applicants, through: :applications

  validates :employer_id, presence: true
end
