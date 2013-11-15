class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # id added automatically by rails
      t.string :username, :null => false
      t.float :latitude, :null =>false
      t.float :longitude, :null => false
      t.string :realName
      t.date :dateOfBirth
      t.string :emailID, :null => false
      t.string :remember_token
      t.string :password, :null => false
      t.timestamps
    end
    add_index :users, :remember_token
    add_index :users, :username, :unique=> true
    add_index :users, :emailID, :unique => true
  end
end
