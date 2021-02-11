class ChangeDataTypeOfSalary < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :salary, :string
  end
end
