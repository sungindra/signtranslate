class AddCategoryIdToSigns < ActiveRecord::Migration[5.2]
  def change
    add_reference :signs, :category, foreign_key: true
  end
end
