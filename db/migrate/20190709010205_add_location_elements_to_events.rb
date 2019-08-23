class AddLocationElementsToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :address, :string
  	add_column :events, :latitude, :decimal
  	add_column :events, :longitude, :decimal
  end
end
