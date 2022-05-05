class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :nombre
      t.integer :nit
      t.integer :telefono
      t.string :mail
      t.string :direccion

      t.timestamps
    end
  end
end
