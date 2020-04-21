class Board < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :flags
  has_many :game_states
  has_many :single_players, through: :game_states, class_name: "User", source: :teamable, source_type: "User"
  has_many :team_players, through: :game_states, class_name: "Team", source: :teamable, source_type: "Team"

  validates :title, presence: true

  def players
    self.single_players + self.team_players
  end

  def players_count
    self.players.count
  end

  def flags_count
    self.flags.count
  end

  def created_at_parsed
    self.created_at.strftime("%d/%m/%Y")
  end
end
