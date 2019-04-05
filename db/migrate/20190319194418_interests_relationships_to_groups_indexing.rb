class InterestsRelationshipsToGroupsIndexing < ActiveRecord::Migration[5.0]
  def change
  	add_index :interests_relationships_to_groups, :frI_id
    add_index :interests_relationships_to_groups, :fdI_id
    add_index :interests_relationships_to_groups, [:frI_id, :fdI_id], unique: true
  end
end
