class AddEventEndTimeToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_end_time, :time
  end
end
