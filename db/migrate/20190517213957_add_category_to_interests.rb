class AddCategoryToInterests < ActiveRecord::Migration[5.0]
  def change
    add_column :interests, :category, :string
  end
end
