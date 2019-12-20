class CreateInterviewsStudents < ActiveRecord::Migration[5.0]
  def up
    create_table :interviews_students do |t|
      t.integer :student_id
      t.integer :interview_id
      t.string :result, index: true
      t.timestamps
    end
    add_index(:interviews_students,[:student_id,:interview_id])
  end
  def down
    drop_table :interviews_students
  end
end
