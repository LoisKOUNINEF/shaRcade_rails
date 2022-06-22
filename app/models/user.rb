class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
  :jwt_authenticatable,
  jwt_revocation_strategy: JwtDenylist

  validates :nickname, presence: true, length: { in: 3..12 }
  validates :firstname, length: { in: 3..12 }
  validates :lastname, length: { in: 3..12 }
  validates :firstname, length: { in: 3..12 }

  enum role: [:player, :editor, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :scores
  has_many :api_calls
  has_many :favorites
  has_many :feedbacks

  def what_role?
    return self.role
  end

  private

  def set_default_role
    return self.role ||= :player
  end
end
