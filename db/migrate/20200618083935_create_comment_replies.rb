class CreateCommentReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_replies do |t|
      t.string :comment
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
