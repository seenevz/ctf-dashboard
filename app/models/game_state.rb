class GameState < ApplicationRecord
  belongs_to :teamable, polymorphic: true
  belongs_to :board
  has_many :captures
end
