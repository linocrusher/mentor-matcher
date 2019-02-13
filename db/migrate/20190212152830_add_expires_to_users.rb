class AddExpiresToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :expires, :datetime
  end
end
