class Monster < ApplicationRecord
  self.inheritance_column = :_type_disabled

  belongs_to :user
  belongs_to :team, optional: true

  ELEMENTS = ['Fire', 'Water', 'Earth', 'Electric', 'Wind']

  validate :monster_type_validation
  validate :no_more_then_20_monsters_for_user

  def no_more_then_20_monsters_for_user
    if user && Monster.where(user: user).count >= 20
      errors.add(:user, "No more monsters for this user!!!")
    end
  end

  def monster_type_validation
    unless ELEMENTS.include?(self.type)
      errors.add(:type, "Choose valid monster type")
    end
  end

  def fight_with(oppontent)
    unless ELEMENTS.include?(self.type)
      return "Choose valid oppontent"
    end
    oppontent_index = ELEMENTS.index(oppontent)
    self_index = ELEMENTS.index(self.type)

   if oppontent_index < self_index
     x = self_index - oppontent_index
     if x <= 2
       return "#{ELEMENTS[self_index]} is stronger then #{ELEMENTS[oppontent_index]}"
     else
       return "#{ELEMENTS[self_index]} is weaker then #{ELEMENTS[oppontent_index]}"
     end
   elsif oppontent_index > self_index
     x = oppontent_index - self_index
     if x <= 2
       return "#{ELEMENTS[oppontent_index]} is stronger then #{ELEMENTS[self_index]}"
     else
       return "#{ELEMENTS[oppontent_index]} is weaker then #{ELEMENTS[self_index]}"
     end
   elsif oppontent_index == self_index
     return "can't fight with each other"
   end

  end



end
