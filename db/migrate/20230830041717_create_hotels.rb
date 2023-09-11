class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels, id: false, primary_key: :hotel_id do |t|
      t.bigint :hotel_id
      t.string :name
      t.string :address
      t.decimal :latitude, :precision=>10, :scale=>6
      t.decimal :longitude, :precision=>10, :scale=>6
      t.string :city 
      t.string :state
      t.string :country
      t.string :contact
      t.string :phone
      t.string :email
      t.text   :description
      
      t.timestamps
    end
  end
end
