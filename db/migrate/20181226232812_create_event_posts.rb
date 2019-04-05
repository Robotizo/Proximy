class CreateEventPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :event_posts do |t|
      t.text :content
      t.string :image
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end
