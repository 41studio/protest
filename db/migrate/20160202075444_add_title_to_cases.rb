class AddTitleToCases < ActiveRecord::Migration
  def change
    add_column :cases, :title, :string
    remove_column :activities, :user_id
  end
end
