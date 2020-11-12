class CreateDictionaries < ActiveRecord::Migration[5.2]
  def change
    create_table :dictionaries do |t|
      t.string :meaning
      t.string :image
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
