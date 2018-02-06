class MonsterSerializer < ActiveModel::Serializer
  attributes :id, :name, :power, :type, :user

  belongs_to :user
  belongs_to :team
end
