class AddUserToHotel < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :user_id, :integer
  end
end
