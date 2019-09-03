class DistanceIsCheckedChanges < ActiveRecord::Migration[5.0]
	def up
	  change_column :users, :distance_is_checked, :boolean, default: false
	end

	def down
	  change_column :users, :distance_is_checked, :boolean, default: nil
	end
end
