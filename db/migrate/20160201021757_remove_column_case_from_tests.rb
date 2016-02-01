class RemoveColumnCaseFromTests < ActiveRecord::Migration
  def change
    remove_column :tests, :is_happy_case
    remove_column :tests, :is_unhappy_case
  end
end
