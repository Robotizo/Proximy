class AddGreetToNotificationEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :notification_events, :greet, :string
  end
end
