class CreateInterestsRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :interests_relationships do |t|
      t.integer :followerI_id
      t.integer :followedI_id

      t.timestamps
    end
  end
end
