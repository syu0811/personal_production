class CreateGroupNumberStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :group_number_students do |t|
      t.references :group, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.integer :number, null: false
      t.timestamps
    end
    add_index :group_number_students, [:group_id, :student_id], unique: true
  end
end
