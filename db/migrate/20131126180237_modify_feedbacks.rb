class ModifyFeedbacks < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :user_id, :integer
  	add_column :feedbacks, :service_id, :integer

  	add_index :feedbacks, [:user_id,:service_id], :unique => true

  end
end
