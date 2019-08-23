class RemoveIndexFromGroupPosts < ActiveRecord::Migration[5.0]
  def change
  	remove_index :group_posts, :group_id
  end
end
