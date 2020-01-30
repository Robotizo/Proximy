class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :name
   		t.string :email, null: false
   		t.timestamps null: false
   		t.string :image
   		t.string :avatar
   		t.text :bio
   		t.decimal :latitude
   		t.decimal :longitude
   		t.integer :sign_in_count
   		t.string :last_name
   		t.string :slug
   		t.boolean :distance_is_checked, default: true
   		t.string :city
   		t.string :ip
   		t.boolean :is_admin, default: false
   		t.string :country
   		t.string :encrypted_password, limit: 128, null: false
		t.string :confirmation_token, limit: 128
		t.string :remember_token, limit: 128, null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
