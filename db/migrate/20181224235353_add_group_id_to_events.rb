class AddGroupIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :group_id, :integer
  end
end
