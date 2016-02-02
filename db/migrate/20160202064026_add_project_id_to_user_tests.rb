class AddProjectIdToUserTests < ActiveRecord::Migration
  def change
    change_table :user_tests do |t|
      t.remove :user_id
      t.belongs_to :project
    end
  end
end
