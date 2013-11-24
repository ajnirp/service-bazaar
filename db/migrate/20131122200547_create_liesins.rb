class CreateLiesins < ActiveRecord::Migration
  def change
    create_table :liesins do |t|
      t.integer :category_id
      t.integer :service_id
    end
    add_index :liesins, :category_id
    add_index :liesins, :service_id
  end
end
