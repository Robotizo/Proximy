class CreateGroupInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :group_invites do |t|
      t.integer :group_id
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
