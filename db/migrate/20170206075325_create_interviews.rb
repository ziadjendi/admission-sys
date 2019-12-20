class CreateInterviews < ActiveRecord::Migration[5.0]
  def up
    create_table :interviews do |t|
      t.string :code
      t.datetime :interview_date
      t.integer :batch_id, index: true
      t.timestamps
    end
  end

  def down
    drop_table :interviews
  end
end
