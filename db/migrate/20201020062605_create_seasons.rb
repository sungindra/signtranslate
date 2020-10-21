class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.string :title
      t.string :tag

      t.timestamps
    end
  end
end
