class GroupsRelationshipsIndexing < ActiveRecord::Migration[5.0]
  def change
  	add_index :groups_relationships, :followerG_id
    add_index :groups_relationships, :followedG_id
    add_index :groups_relationships, [:followerG_id, :followedG_id], unique: true
  end
end
