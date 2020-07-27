class RemoveImagesFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :image, :string
  end
end
