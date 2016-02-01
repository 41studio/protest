class AddUserIdToUserTests < ActiveRecord::Migration
  def change
    add_column :user_tests, :user_id, :integer
    add_index :user_tests, :user_id
  end
end
