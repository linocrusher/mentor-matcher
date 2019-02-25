class Revert < ActiveRecord::Migration[5.1]
  def change
  	remove_column :feedbacks, :sender_id
  	remove_column :feedbacks, :recipient_id
  	add_column :feedbacks, :sender, :integer
  	add_column :feedbacks, :recipient, :integer
  end
end
