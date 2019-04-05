class CreateGroupPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :group_posts do |t|
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
