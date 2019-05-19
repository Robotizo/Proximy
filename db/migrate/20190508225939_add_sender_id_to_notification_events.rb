class AddSenderIdToNotificationEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :notification_events, :sender_id, :integer
  end
end
