class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.belongs_to :sender, foreign_key: true
      t.belongs_to :recipient, foreign_key: true
      t.string :type
      t.text :content

      t.timestamps
    end
  end
end
