class CreateOrdens < ActiveRecord::Migration[7.0]
  def change
    create_table :ordens do |t|
      t.string :nombre
      t.integer :precio
      t.integer :cantidad
      t.integer :total
      t.string :punto_venta
      t.string :responsable

      t.timestamps
    end
  end
end
