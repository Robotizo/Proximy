class AddCurrentStepToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_step, :string
  end
end
