class AddNumberToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :number, :integer
  end
end
