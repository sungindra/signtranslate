class AddStatusToSigns < ActiveRecord::Migration[5.2]
  def change
    add_column :signs, :status, :string
  end
end
