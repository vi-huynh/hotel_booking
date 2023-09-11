class AddSlugToHotel < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :slug, :string
  end
end
