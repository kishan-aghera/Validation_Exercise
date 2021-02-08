class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string
    add_column :users, :phone, :integer
    add_column :users, :city, :string
    add_column :users, :zip_code, :integer
    add_column :users, :designation, :string
    add_column :users, :company, :string
  end
end
