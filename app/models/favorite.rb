class Favorite < ApplicationRecord
  belongs_to :game_type, optional: true
  belongs_to :game, optional: true
  belongs_to :user
end
