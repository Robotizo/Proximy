class AddLatitudeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :latitude, :decimal
  end
end
