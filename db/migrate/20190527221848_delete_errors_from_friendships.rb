class DeleteErrorsFromFriendships < ActiveRecord::Migration[5.0]
  def change
  	remove_column :friendships, :create, :string
  	remove_column :friendships, :destroy, :string
  end
end
