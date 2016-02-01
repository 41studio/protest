class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.text :scenario
      t.text :expected_result
      t.text :actual_result
      t.integer :test_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :cases, :test_id
    add_index :cases, :user_id
  end
end
