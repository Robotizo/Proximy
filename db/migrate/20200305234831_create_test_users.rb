class CreateTestUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :test_users do |t|
      t.string :email

      t.timestamps
    end
  end
end
