class CreateRventa < ActiveRecord::Migration[7.0]
  def change
    create_table :rventa do |t|
      t.string :Nombre
      t.string :Responsable
      t.integer :Telefono
      t.string :Mail
      t.string :Direccion

      t.timestamps
    end
  end
end
