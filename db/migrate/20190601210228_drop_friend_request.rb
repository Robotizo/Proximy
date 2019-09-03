class DropFriendRequest < ActiveRecord::Migration[5.0]
  def change
  	drop_table :friend_requests
  end
end
