class CreatePickupLogs < ActiveRecord::Migration
  def change
    create_table :pickup_logs do |t|
      t.integer :user_id
      t.integer :thing_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
