class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.integer :sender
      t.integer :recipient
      t.string :t
      t.text :content

      t.timestamps
    end
  end
end
