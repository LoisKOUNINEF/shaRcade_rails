class User < ApplicationRecord
  after_create :welcome_send

  devise :database_authenticatable, :registerable,
  :jwt_authenticatable,
  jwt_revocation_strategy: JwtDenylist

  validates :nickname, presence: true, length: { in: 3..20 }
  validates :firstname, length: { in: 3..20 }
  validates :lastname, length: { in: 3..20 }

  enum role: [:player, :editor, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :scores
  has_many :played_games, through: :scores, class_name: :game
  has_many :api_calls
  has_many :registered_games, through: :api_calls, class_name: :game
  has_many :favorites
  has_many :favorite_games, through: :favorites, class_name: :game
  has_many :feedbacks
  has_many :evaluated_games, through: :feedbacks, class_name: :game

  def what_role?
    return self.role
  end


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  private

  def set_default_role
    return self.role ||= :player
  end
end
