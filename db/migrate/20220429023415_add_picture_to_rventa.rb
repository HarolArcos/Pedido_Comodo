class AddPictureToRventa < ActiveRecord::Migration[7.0]
  def change
    add_column :rventa, :perfil, :string
  end
end
