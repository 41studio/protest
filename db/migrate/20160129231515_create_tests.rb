class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :about
      t.integer :project_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :tests, :project_id
    add_index :tests, :user_id
  end
end
