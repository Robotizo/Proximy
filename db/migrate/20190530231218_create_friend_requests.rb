class CreateFriendRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_requests do |t|
      t.integer :friend_id
      t.integer :user_id

      t.timestamps
    end
  end
end
