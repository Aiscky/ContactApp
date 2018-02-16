class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone_number
      t.string :street
      t.integer :postal_code
      t.string :city
      t.string :country
      t.string :picture

      t.timestamps
    end
  end
end
