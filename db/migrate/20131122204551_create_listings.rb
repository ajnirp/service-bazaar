class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.datetime :startingTime
      t.datetime :endingTime
      t.float :minPrice
      t.float :maxPrice
      t.date :startDate
      t.date :endDate
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :availability

      t.integer :service_id
    end
    execute "alter table listings add constraint desc_length check (length(description) <= 100 and length(description) >= 0)"
    add_index :listings, :service_id
  end
end
