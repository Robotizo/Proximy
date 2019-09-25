class CreateGroupComments < ActiveRecord::Migration[5.0]
  def change
    create_table :group_comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :group_post_id

      t.timestamps
    end
  end
end
