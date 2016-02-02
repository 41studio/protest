class AddProjectUserTable < ActiveRecord::Migration
  def change
    create_table :projects_users, id: false do |t|
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
    end

    remove_column :tests, :user_id
    remove_column :activities, :user_test_id

    change_table :cases do |t|
      t.remove :user_id
      t.remove :actual_result
      t.belongs_to :user_test
    end

  end
end
