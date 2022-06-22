class GameType < ApplicationRecord
  has_many :games
  has_many :favorites
end
