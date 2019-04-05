class AddImageToInterests < ActiveRecord::Migration[5.0]
  def change
    add_column :interests, :image, :string
  end
end
