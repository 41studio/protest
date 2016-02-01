class AddUserTestIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :user_test_id, :integer
    add_index :activities, :user_test_id
  end
end
