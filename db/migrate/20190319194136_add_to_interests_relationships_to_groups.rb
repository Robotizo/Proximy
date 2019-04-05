class AddToInterestsRelationshipsToGroups < ActiveRecord::Migration[5.0]
  def change
  	add_column :interests_relationships_to_groups, :frI_id, :integer
  	add_column :interests_relationships_to_groups, :fdI_id, :integer
  end
end
