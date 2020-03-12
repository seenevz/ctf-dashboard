class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validate :membership_uniqueness

  def membership_uniqueness
    if self.team.members.include?(self.user)
       errors.add(:membership, "already exists")
    end
  end
end
