class ChangeVoteToEnum < ActiveRecord::Migration[5.2]
  def up
    add_column :votes, :vote, :integer
    Vote.all.each do |vote|
      vote.update(vote: 1) if vote.up
      vote.update(vote: 0) unless vote.up
    end
    remove_column :votes, :up
  end

  def down
    add_column :votes, :up, :boolean
    Vote.all.each do |vote|
      vote.update(up: true) if vote.up?
      vote.update(up: false) if vote.down?
    end
    remove_column :votes, :vote
  end
end
