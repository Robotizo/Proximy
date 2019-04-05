class CreateInterestsRelationshipsToGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :interests_relationships_to_groups do |t|
      t.timestamps
    end
  end
end
