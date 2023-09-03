class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :reservation_id
      t.integer :payment_method
      t.decimal :amount
      t.datetime :payment_at

      t.timestamps
    end
  end
end
