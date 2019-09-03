class DistanceIsCheckedChangesTwo < ActiveRecord::Migration[5.0]
	def up
	  change_column :users, :distance_is_checked, :boolean, default: true
	end

	def down
	  change_column :users, :distance_is_checked, :boolean, default: false
	end
end
