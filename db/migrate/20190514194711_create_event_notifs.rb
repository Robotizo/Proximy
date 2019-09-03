class CreateEventNotifs < ActiveRecord::Migration[5.0]
  def change
    create_table :event_notifs do |t|
      t.boolean :is_checked
      t.integer :event_id

      t.timestamps
    end
  end
end
