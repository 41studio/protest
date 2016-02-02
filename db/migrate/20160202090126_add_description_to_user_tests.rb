class AddDescriptionToUserTests < ActiveRecord::Migration
  def change
    add_column :user_tests, :description, :text
  end
end
