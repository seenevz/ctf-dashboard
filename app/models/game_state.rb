class GameState < ApplicationRecord
  belongs_to :team, polymorphic: true
  belongs_to :board
  has_many :captures
end
