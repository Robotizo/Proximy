class AddDefaultFalseToIsChecked < ActiveRecord::Migration[5.0]
	def up
	  change_column :event_notifs, :is_checked, :boolean, default: false
	end

	def down
	  change_column :event_notifs, :is_checked, :boolean, default: nil
	end
end
