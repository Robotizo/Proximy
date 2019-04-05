class AddCoverImageToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :cover_image, :string
  end
end
