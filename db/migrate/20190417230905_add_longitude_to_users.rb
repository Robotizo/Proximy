class AddLongitudeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :longitude, :decimal
  end
end
