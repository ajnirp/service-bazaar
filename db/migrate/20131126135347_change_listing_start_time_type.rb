class ChangeListingStartTimeType < ActiveRecord::Migration
  def change
    change_column :listings, :startingTime, :time
    change_column :listings, :endingTime, :time
  end
end
