class BlockingRelationshipsIndexing < ActiveRecord::Migration[5.0]
  def change
  	add_index :blocking_relationships, :blocker_id
    add_index :blocking_relationships, :blocked_id
    add_index :blocking_relationships, [:blocker_id, :blocked_id], unique: true
  end
end
