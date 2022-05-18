class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :nombre
      t.integer :codigo
      t.string :empresa
      t.integer :precio
      t.text :descripcion

      t.timestamps
    end
  end
end
