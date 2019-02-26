class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :voter
      t.integer :target
      t.integer :value

      t.timestamps
    end
  end
end
