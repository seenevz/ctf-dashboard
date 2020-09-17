class User < ApplicationRecord
  has_many :owned_boards, class_name: "Board"
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :team_games, class_name: "GameState", through: :teams, source: :game_states
  has_many :singleplayer_games, class_name: "GameState", as: :teamable, source: :game_states

  validates :username, uniqueness: { case_sensitive: false }
  validates :username, :password, presence: true
  validates :password, length: { minimum: 10 }
  validates :password, confirmation: true
  validate { |user|
    if user.password != user.password_confirmation
      errors.add(:password, "confirmation must match password")
    end
  }

  has_secure_password

  def total_games
    self.team_games + self.singleplayer_games
  end
end
