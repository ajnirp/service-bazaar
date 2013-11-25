class AddDistanceToListings < ActiveRecord::Migration
  def change
    add_column :listings, :distance, :float
  end
end
