class InterestsRelationshipsToEventsIndexing < ActiveRecord::Migration[5.0]
  def change
  	add_index :interests_relationships_to_events, :frE_id
    add_index :interests_relationships_to_events, :fdE_id
    add_index :interests_relationships_to_events, [:frE_id, :fdE_id], unique: true
  end
end
