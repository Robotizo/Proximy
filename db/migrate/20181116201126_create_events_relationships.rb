class CreateEventsRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :events_relationships do |t|
    	t.integer :followerE_id
    	t.integer :followedE_id

    	t.timestamps
    end
  end
end
