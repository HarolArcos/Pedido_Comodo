class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios do |t|
      t.string :Mail
      t.string :Codigo
      t.string :tipo

      t.timestamps
    end
  end
end
