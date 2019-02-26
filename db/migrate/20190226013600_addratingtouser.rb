class Addratingtouser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :rating, :float
  end
end
