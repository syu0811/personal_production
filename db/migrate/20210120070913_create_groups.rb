class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :school_year, null: false
      t.integer :number, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :groups, [:school_year, :number], unique: true
  end
end
