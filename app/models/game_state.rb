class GameState < ApplicationRecord
  belongs_to :team, polymorphic: true
end
