class Board < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :flags
  has_many :game_states
  has_many :single_players, through: :game_states, class_name: 'User', source: :team, source_type: 'User'
  has_many :team_players, through: :game_states, class_name: 'Team', source: :team, source_type: 'Team'

  validates :title, presence: true
  
  def players
    self.single_players + self.team_players
  end
end
