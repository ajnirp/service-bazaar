class Listing < ActiveRecord::Base
  belongs_to :service

  validates :description, :length => { :maximum => 100 } 
  validates :description, :presence => true
  validates :availability, :presence => true
  validates :startingTime, :presence => true
  validates :endingTime, :presence => true
  validates :startDate, :presence => true
  validates :endDate, :presence => true
  validates :minPrice, :presence => true
  validates :maxPrice, :presence => true
end
