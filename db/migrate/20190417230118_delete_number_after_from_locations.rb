class DeleteNumberAfterFromLocations < ActiveRecord::Migration[5.0]
  def change
  	remove_column :locations, :number_after, :integer
  end
end
