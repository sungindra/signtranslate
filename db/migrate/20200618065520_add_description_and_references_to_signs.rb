class AddDescriptionAndReferencesToSigns < ActiveRecord::Migration[5.2]
  def change
    add_column :signs, :description, :string
    add_reference :signs, :user, foreign_key: true
    add_reference :signs, :post, foreign_key: true
  end
end
