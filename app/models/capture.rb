class Capture < ApplicationRecord
  belongs_to :flag
  belongs_to :game_state
end
