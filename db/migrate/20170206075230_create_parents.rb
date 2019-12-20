class CreateParents < ActiveRecord::Migration[5.0]
  def up
    create_table :parents do |t|
      t.integer :student_id, index: true
      t.string :first_name
      t.string :last_name
      t.string :relation
      t.string :dob
      t.string :education
      t.string :occupation
      t.string :incom
      t.string :police_relatives
      t.string :country
      t.string :state
      t.string :city
      t.string :email
      t.string :address_line1
      t.string :address_line2
      t.string :phone1
      t.string :phone2
      t.string :mobile
      t.string :company

      t.timestamps
    end
  end

  def down
    drop_table :parents
  end
end
