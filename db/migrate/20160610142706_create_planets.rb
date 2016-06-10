class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.string :type
      t.belongs_to :star, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :planets, :name, unique: true
  end
end
