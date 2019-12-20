class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :username
      t.string :hashed_password
      t.string :full_name
      t.integer :student_id, index: true
      t.boolean :is_student, default: false
      t.boolean :is_employee, default: false

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
