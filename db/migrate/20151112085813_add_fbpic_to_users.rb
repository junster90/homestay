class AddFbpicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fbpic, :string
  end
end
