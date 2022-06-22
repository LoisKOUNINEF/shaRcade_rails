class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
  :jwt_authenticatable,
  jwt_revocation_strategy: JwtDenylist

  validates :nickname, presence: true, length: { in: 3..12 }
  validates :firstname, length: { in: 3..12 }
  validates :lastname, length: { in: 3..12 }
  validates :firstname, length: { in: 3..12 }

  has_many :scores
  has_many :api_calls
  has_many :favorites
  has_many :feedbacks
end
