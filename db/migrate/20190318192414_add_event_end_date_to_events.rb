class AddEventEndDateToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_end_date, :date
  end
end
