class CreateDetalleps < ActiveRecord::Migration[7.0]
  def change
    create_table :detalleps do |t|
      t.integer :cantidad
      t.references :catalogo, null: false, foreign_key: true
      t.references :rpedido, null: false, foreign_key: true

      t.timestamps
    end
  end
end
