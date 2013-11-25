class Listing < ActiveRecord::Base
  belongs_to :service
  has_many :appointments

  validates :description, :length => { :maximum => 100 } 
  validates :description, :presence => true
  validates :availability, :presence => true
  validates :startingTime, :presence => true
  validates :endingTime, :presence => true
  validates :startDate, :presence => true
  validates :endDate, :presence => true
  validates :minPrice, :presence => true
  validates :maxPrice, :presence => true

  validate :start_time_less
  validate :start_date_less
  validate :min_price_less

  private

  def start_time_less
    errors.add(:startingTime, "should be less than ending time") if startingTime > endingTime
  end

  def start_date_less
    errors.add(:startDate, "should be less than end Date") if startDate > endDate
  end

  def min_price_less
    errors.add(:minPrice, "should be less than maximum price") if minPrice > maxPrice
  end
end
