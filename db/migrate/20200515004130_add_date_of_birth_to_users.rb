class AddDateOfBirthToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :date_of_birth, :date
  end
end
