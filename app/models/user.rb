class User < ApplicationRecord
  has_many :owned_boards, class_name: 'Board'
  has_many :singleplayer_games, class_name: 'GameState', as: :team
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :team_games, class_name: 'GameState', through: :teams, source: :game_states

  has_secure_password
end

