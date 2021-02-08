class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :linkedin_id, :string
    add_column :users, :experience, :integer
    add_column :users, :salary, :integer
  end
end
