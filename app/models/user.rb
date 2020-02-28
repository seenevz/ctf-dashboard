class User < ApplicationRecord
  has_many :boards
  has_many :memberships
  has_many :teams, through: :memberships

  has_secure_password
end

