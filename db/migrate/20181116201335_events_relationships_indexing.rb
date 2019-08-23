class EventsRelationshipsIndexing < ActiveRecord::Migration[5.0]
  def change
  	add_index :events_relationships, :followerE_id
    add_index :events_relationships, :followedE_id
    add_index :events_relationships, [:followerE_id, :followedE_id], unique: true
  end
end
