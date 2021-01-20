class AddColumnUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :job, null: true, foreign_key: true
    add_reference :students, :group, null: true, foreign_key: true
    add_index :students, [:number, :group_id], unique: true
  end
end
