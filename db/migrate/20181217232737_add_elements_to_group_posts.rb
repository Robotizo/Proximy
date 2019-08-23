class AddElementsToGroupPosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :group_posts, :group_id, :integer
  	add_column :group_posts, :user_id, :integer
  	add_index :group_posts, :group_id
  	
  end
end
