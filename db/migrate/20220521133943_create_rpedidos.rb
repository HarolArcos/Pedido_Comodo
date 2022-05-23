class CreateRpedidos < ActiveRecord::Migration[7.0]
  def change
    create_table :rpedidos do |t|
      t.string :tiendita
      t.string :responsable
      t.string :id_producto
      t.string :cantidad

      t.timestamps
    end
  end
end
