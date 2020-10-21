class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.integer :level
      t.string :video
      t.string :answer
      t.string :hint
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
