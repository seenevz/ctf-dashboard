class Team < ApplicationRecord
  has_many :memberships
  has_many :members, through: :memberships, class_name: 'User', source: :user
  has_many :game_states, as: :teamable

  validates :name, presence: true
end
