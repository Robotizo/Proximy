class AddEventIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :event_id, :integer
  end
end
