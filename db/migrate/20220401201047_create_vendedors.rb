class CreateVendedors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendedors do |t|
      t.string :Nombre
      t.string :Apellido_Paterno
      t.string :Apellido_Materno
      t.integer :Telefono
      t.string :Mail
      t.string :Direccion

      t.timestamps
    end
  end
end
