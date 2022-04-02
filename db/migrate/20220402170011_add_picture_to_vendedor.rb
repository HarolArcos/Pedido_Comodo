class AddPictureToVendedor < ActiveRecord::Migration[7.0]
  def change
    add_column :vendedors, :perfil, :string
  end
end
