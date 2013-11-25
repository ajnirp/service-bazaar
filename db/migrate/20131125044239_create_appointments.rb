class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.float :price
      t.boolean :isConfirmed
      t.date :date # date on which actual appointment happens
      t.integer :user_id
      t.integer :listing_id
      t.timestamps
    end
    add_index :appointments, :user_id
    add_index :appointments, :listing_id
  end
end
