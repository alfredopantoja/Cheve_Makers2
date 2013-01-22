class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :user_id

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
