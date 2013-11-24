class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.float :rating
      t.text :review
    end
    execute "alter table feedbacks add constraint rating_range check (rating >= 0 and rating <= 5)"
  end
end
