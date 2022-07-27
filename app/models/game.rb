class Game < ApplicationRecord
  validates :game_url, uniqueness: true

  belongs_to :game_type
  has_many :scores, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_one :api_call, dependent: :destroy
  has_many :scorers, through: :scores, class_name: :user          # Game player reached via related hi-score(s), hence the "scorer" alias
  has_many :fans, through: :favorites, class_name: :user           # Game player reached via his/her favorites' list, hence the "fan" alias
  has_many :evaluators, through: :feedbacks, class_name: :user     # Game player or editor reached via existing feedbacks, hence the "evaluator" alias
  has_one :owner, through: :api_calls, class_name: :user          # Game editor, hence the "owner" alias
end
