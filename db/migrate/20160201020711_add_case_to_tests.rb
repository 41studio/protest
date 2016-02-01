class AddCaseToTests < ActiveRecord::Migration
  def change
    add_column :tests, :is_happy_case, :boolean, default: false
    add_column :tests, :is_unhappy_case, :boolean, default: false
  end
end
