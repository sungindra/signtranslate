class CreateSigns < ActiveRecord::Migration[5.2]
  def change
    create_table :signs do |t|
      t.string :image
      t.string :meaning
      t.integer :sign_type

      t.timestamps
    end
  end
end
