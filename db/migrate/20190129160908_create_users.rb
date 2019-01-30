class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :lastname
      t.string :firstname
      t.string :mi
      t.string :address
      t.string :username
      t.string :password
      t.string :salt
      t.string :status
      t.timestamps
    end
  end
end
