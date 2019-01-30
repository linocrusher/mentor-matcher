class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :encrypted_password, :password
  end
end
