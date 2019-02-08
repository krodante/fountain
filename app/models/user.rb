class User < ApplicationRecord
  ROLES = ['applicant', 'employer'].freeze

  has_one :applicant, dependent: :destroy
  has_one :employer, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
