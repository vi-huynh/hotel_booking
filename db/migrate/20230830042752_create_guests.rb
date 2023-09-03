class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.string :guest_name
      t.string :guest_phone_number
      t.string :guest_email
      t.string :guest_address

      t.timestamps
    end
  end
end
