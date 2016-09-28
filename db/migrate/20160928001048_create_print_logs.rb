class CreatePrintLogs < ActiveRecord::Migration
  def change
    create_table :print_logs do |t|
      t.integer :user_id
      t.integer :thing_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
