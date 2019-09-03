class AddRecipientIdToNotificationEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :notification_events, :recipient_id, :integer
  end
end
