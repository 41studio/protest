class CreateUserTests < ActiveRecord::Migration
  def change
    create_table :user_tests do |t|
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
