class CreateCancellations < ActiveRecord::Migration[7.0]
  def change
    create_table :cancellations do |t|
      t.text :reason
      t.datetime :cancelled_at

      t.timestamps
    end
  end
end
