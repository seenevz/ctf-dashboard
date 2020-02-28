class User < ApplicationRecord
  has_many :boards
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :game_states, as: :team

  has_secure_password
end

