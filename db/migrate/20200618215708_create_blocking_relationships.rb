class CreateBlockingRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :blocking_relationships do |t|
      t.integer :blocker_id
      t.integer :blocked_id

      t.timestamps
    end
  end
end
