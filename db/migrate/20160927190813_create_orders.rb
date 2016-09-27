class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :thing_id
      t.integer :orderer_id
      t.integer :material_id
      t.decimal :unitary_price
      t.text :comment

      t.timestamps null: false
    end
  end
end
