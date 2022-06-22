class Game < ApplicationRecord
  belongs_to :game_type
  has_many :scores
  has_many :favorites
  has_many :feedbacks
  has_one :api_call
  # TO BE DISCUSSED WITH THE TEAM BEFORE UNCOMMENTING
  # has_many :players, through: :scores # Game player reached via related hi-score(s)
  # has_many :fans, through: # Game player reached via the favorites' list
  # has_many :evaluators, through: # Game player reached via existing feedbacks
  # has_one :owner, through: :api_call, class_name: :user # Game editor hence owner
end
