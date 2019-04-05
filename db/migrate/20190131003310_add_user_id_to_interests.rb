class AddUserIdToInterests < ActiveRecord::Migration[5.0]
  def change
    add_column :interests, :user_id, :integer
  end
end
