class CreateEmpresas < ActiveRecord::Migration[7.0]
  def change
    create_table :empresas do |t|
      t.string :codigo
      t.string :nombre
      t.integer :telefono
      t.string :direccion

      t.timestamps
    end
  end
end
