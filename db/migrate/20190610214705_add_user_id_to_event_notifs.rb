class AddUserIdToEventNotifs < ActiveRecord::Migration[5.0]
  def change
    add_column :event_notifs, :user_id, :integer
  end
end
