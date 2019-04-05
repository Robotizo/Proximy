class CreateInterestsRelationshipsToEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :interests_relationships_to_events do |t|
      t.integer :frE_id
      t.integer :fdE_id

      t.timestamps
    end
  end
end
