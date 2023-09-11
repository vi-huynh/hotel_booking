class CreateCancellations < ActiveRecord::Migration[7.0]
  def change
    create_table :cancellations, id: false, primary_key: :cancellation_id do |t|
      t.bigint :cancellation_id
      t.bigint :reservation_id
      t.text :reason
      t.datetime :cancelled_at

      t.timestamps
    end
  end
end
