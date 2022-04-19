class AddPictureToSupervisor < ActiveRecord::Migration[7.0]
  def change
    add_column :supervisors, :perfil, :string
  end
end
