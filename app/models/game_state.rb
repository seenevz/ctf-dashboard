class GameState < ApplicationRecord
  belongs_to :team, polymorphic: true
  belongs_to :board
end
