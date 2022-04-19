class CreateSupervisors < ActiveRecord::Migration[7.0]
  def change
    create_table :supervisors do |t|
      t.string :Nombre
      t.string :Apellido_Paterno
      t.string :Apellido_Materno
      t.integer :Teléfono
      t.string :Mail
      t.string :Dirección

      t.timestamps
    end
  end
end
