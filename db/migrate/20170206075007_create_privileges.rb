class CreatePrivileges < ActiveRecord::Migration[5.0]
  def up
    create_table :privileges do |t|
      t.string :description
      t.timestamps
    end
  end

  def down
    drop_table :privileges
  end

end
