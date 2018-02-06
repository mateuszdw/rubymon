class Team < ApplicationRecord
  belongs_to :user
  has_many :monsters

  validate :no_more_then_3_teams_for_user

  def no_more_then_3_teams_for_user
    if user && Team.where(user: user).count >= 3
      errors.add(:user, "No more teams for this user!!!")
    end
  end
end
