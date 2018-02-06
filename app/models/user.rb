class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :teams
  has_many :monsters

  validate :no_more_then_20_monsters_validate
  validate :no_more_then_3_teams_validate

  def no_more_then_20_monsters_validate
    if self.monsters.size >= 20
      errors.add(:monsters, "No more monsters!!!")
    end
  end

  def no_more_then_3_teams_validate
    if self.teams.size >= 3
      errors.add(:teams, "No more teams!!!")
    end
  end

end
