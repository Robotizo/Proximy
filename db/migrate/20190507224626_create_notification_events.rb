class CreateNotificationEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_events do |t|
      t.integer :event_id

      t.timestamps
    end
  end
end
