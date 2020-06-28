class DropComments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comment_replies, :comment, foreign_key: true
    add_reference :comment_replies, :sign, foreign_key: true
    drop_table :comments
  end
end
