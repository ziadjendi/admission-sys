class CreateCandidates < ActiveRecord::Migration[5.0]
  def up
    create_table :candidates, id: false do |t|
      t.integer :student_id, index: true
      t.boolean :medical_test_result, default: false
      t.string :medical_reason
      t.string :medical_doc
      t.boolean :sport_test_result, default: false
      t.boolean :is_key_student, index: true, default: false
      t.boolean :is_reserve_student, index: true, default: false
      t.boolean :is_scholarship_student, index: true, default: false
      t.timestamps
    end
  end

  def down
    drop_table :candidates
  end
end
