class AddIpToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ip, :string
  end
end
