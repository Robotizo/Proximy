class CreateGroupsRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_relationships do |t|
   		t.integer :followerG_id
    	t.integer :followedG_id

    	t.timestamps
    end
  end
end
