class Board < ApplicationRecord
  belongs_to :user
  has_many :flags
  has_many :game_states
  has_many :users, through: :game_states
end
