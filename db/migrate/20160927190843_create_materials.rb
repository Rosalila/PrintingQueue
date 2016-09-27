class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.integer :color_id
      t.boolean :in_stock

      t.timestamps null: false
    end
  end
end
