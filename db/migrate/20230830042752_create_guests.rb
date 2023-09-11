class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests, id: false, primary_key: :guest_id do |t|
      t.bigint :guest_id
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
