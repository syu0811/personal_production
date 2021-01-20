class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.date :birthdate, null: false
      t.integer :number, null: false
      t.timestamps
    end
  end
end
