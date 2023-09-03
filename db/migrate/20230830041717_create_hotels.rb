class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.string :hotel_address
      t.string :hotel_contact
      t.string :hotel_email
      t.text   :hotel_description
      t.timestamps
    end
  end
end
