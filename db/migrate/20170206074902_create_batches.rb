class CreateBatches < ActiveRecord::Migration[5.0]
  def up
    create_table :batches do |t|
      t.string :code
      t.string :name
      t.boolean :is_active, default: true
      t.timestamps
    end
  end

  def down
    drop_table :batches;
  end
end
