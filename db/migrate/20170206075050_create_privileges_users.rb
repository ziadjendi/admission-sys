class CreatePrivilegesUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :privileges_users do |t|
      t.integer :privilege_id
      t.integer :user_id
      t.timestamps
    end
    add_index(:privileges_users,[:privilege_id,:user_id])
  end

  def down
    drop_table :privileges_users
  end

end
