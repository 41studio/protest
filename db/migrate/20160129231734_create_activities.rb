class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :description
      t.string :status
      t.integer :case_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :activities, :case_id
    add_index :activities, :user_id
  end
end
