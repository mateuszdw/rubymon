class Monster < ApplicationRecord

  belongs_to :user
  belongs_to :team, optional: true

  validate :monster_type_validation

  def monster_type_validation
    unless ['Fire', 'Water', 'Earth', 'Electric', 'Wind'].include?(self.type)
      errors.add(:type, "Choose valid monster type")
    end
  end

  def fight_with(another_monster)
    self::WINS_WITH

    self.win_with(another_monster)

    if self::WINS_WITH == another_monster.class_name
      puts "WINNING"
    end
    if self::LOOSES_WITH == another_monster.class_name
      puts "LOOSING"
    end
  end



end
