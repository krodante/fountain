class User < ApplicationRecord
  ROLES = %w(applicant employer).freeze

  has_one :applicant, dependent: :destroy
  has_one :employer, dependent: :destroy

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates_inclusion_of :role,
    in: ROLES
end
