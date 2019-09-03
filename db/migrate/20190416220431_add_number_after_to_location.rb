class AddNumberAfterToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :number_after, :integer
  end
end
