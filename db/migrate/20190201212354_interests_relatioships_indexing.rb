class InterestsRelatioshipsIndexing < ActiveRecord::Migration[5.0]
  def change
  	add_index :interests_relationships, :followerI_id
    add_index :interests_relationships, :followedI_id
    add_index :interests_relationships, [:followerI_id, :followedI_id], unique: true
  end
end
