class CreateMonsters < ActiveRecord::Migration[5.1]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :power
      t.string :type
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
